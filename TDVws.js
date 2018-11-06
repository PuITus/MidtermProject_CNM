var WebSocket = require('ws');
var Config = require('./config');
var Auth = require('./repos/authRepo');
var SOCKET_PORT = 3001;
var socketServer;
var clients = 0;
var maxClient = Config.TDV;
if (!socketServer) {
    socketServer = new WebSocket.Server({
        port: SOCKET_PORT
    });
    function sentError (ws,error) {
        if(ws.readyState === WebSocket.OPEN)
              {
                var msg = {
                    type: 'error',
                    payload: { message: error}};
                ws.send(JSON.stringify(msg));
              }  
       
      }
    function toEvent (message) {
        try {
          var event = JSON.parse(message);
          if(event.type!="authenticate"&&this.authenticate==0)
          {
              sentError(this,"Vui lòng đăng nhập")
              this.close();
          }

          this.emit(event.type, event.payload);
        } catch(err) {
          console.log('not an event' , err);
        }
      }
   



    socketServer.on('connection', ws => {
        clients++;
        ws.test = "CC";
        ws.authenticate = 0;
        // Kiểm tra đã xác thực chưa 
        const checkA = setTimeout(()=>{
            if(ws.readyState === WebSocket.OPEN)
              {
                sentError(ws,'Vui lòng đăng nhập1');
                ws.close();
              }  
        },1500); 
        //Kiểm tra số lượng tổng đài viên đang hoạt động
        if(clients > maxClient )
        {
            console.log(`The TDV system's overload (${maxClient}), refuse connect request`)
            sentError(ws,'Hệ thống đang quá tải, vui lòng quay lại sau');
            ws.close();
        }
        else
        {
            console.log(`A TDV is connected (${clients} is online)`);
        }


        //Xử lý khi nhận message
        ws.on('message', toEvent)
        .on('authenticate', function (data) {
           Auth.verifyAccessTokenWS(data.token, (err, payload) => {
            if (err) {
                sentError(ws,'Thông tin không hợp lệ, vui lòng đăng nhập lại!');
                ws.close();
                return;
            }
          else 
          {
              //Kiểm tra loại tài khoản 
              if(payload.user)
              {
                if(payload.user.AccountType_ID !=1)
                {
                    sentError(ws,'Tài khoản của bạn không phải TĐV');
                  ws.close();
                }
                else 
                {   ws.user = user;
                    ws.authenticate = 1; 
                    clearTimeout(checkA);
                }
              }
          }
        }); })
        .on('push', function (data) {
            console.log(data);
        });

        ws.on('close', msg => {
            clients--;
            console.log(`close TDV (${clients} is online)`);
        });
      
    });

    console.log(`WS running on port ${SOCKET_PORT}`);
}

var broadcastAll = msg => {
    for (var c of socketServer.clients) {
    	console.log(c.readyState);
        if (c.readyState === WebSocket.OPEN) {
            c.send(msg);
        }
    }
}

module.exports = {
    socketServer,
    broadcastAll
}