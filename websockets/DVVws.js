var WebSocket = require('ws');
var Config = require('../config');
var Auth = require('../repos/authRepo');
var requestRepo = require('../repos/requestRepo');
var geocoderRepo = require('../repos/geocoderRepo');
var SOCKET_PORT = 3002;
var socketServer;
var clients = 0;
var maxClient = Config.DVV;
var TXws = require('../websockets/TXws');
 


if (!socketServer) {
  
    socketServer = new WebSocket.Server({
        port: SOCKET_PORT
    });
    function sendError (ws,error) {
        if(ws.readyState === WebSocket.OPEN)
              {
                var msg = {
                    type: 'error',
                    payload: { message: error}};
                ws.send(JSON.stringify(msg));
              }  
       
      }
      function sendSuccess (ws,Data) {
        if(ws.readyState === WebSocket.OPEN)
              {

                var msg = {
                    type: 'success',
                    payload: Data};
                ws.send(JSON.stringify(msg));
              }  
      }
    function toEvent (message) {
        try {
          var event = JSON.parse(message);
          if(event.type!="authenticate"&&this.authenticate==0)
          {
              sendError(this,"Vui lòng đăng nhập")
              this.close();
          }

          this.emit(event.type, event.payload);
        } catch(err) {
          console.log('not an event' , err);
        }
      }
   

  

   
    socketServer.on('connection', ws => {
        ws.currentRequest = -1;
        clients++;
        ws.authenticate = 0;
        // Kiểm tra đã xác thực chưa 
        const checkA = setTimeout(()=>{
            if(ws.readyState === WebSocket.OPEN)
              {
                
                sendError(ws,'Vui lòng đăng nhập');
                ws.close();
              }  
        },1500); 
        //Kiểm tra số lượng định vị viên đang hoạt động
        if(clients > maxClient )
        {
            console.log(`The DVV system's overload (${maxClient}), refuse connect request`)
            sendError(ws,'Hệ thống đang quá tải, vui lòng quay lại sau');
            ws.close();
        }
        else
        {
            console.log(`A DVV is connected (${clients} is online)`);
        }


        //Xử lý khi nhận message
        ws.on('message', toEvent)
        .on('authenticate', function (data) {
            
           Auth.verifyAccessTokenWS(data.Token, (err, payload) => {
            if (err) {
              console.log(err);
                sendError(ws,'Thông tin không hợp lệ, vui lòng đăng nhập lại!');
                ws.close();
                return;
            }
          else 
          {
              //Kiểm tra loại tài khoản 
              if(payload.user)
              {
                if(payload.user.AccountType_ID !=2)
                {
                    sendError(ws,'Tài khoản của bạn không phải ĐVV');
                  ws.close();
                  return;
                }
                else 
                { //Authenticate thanh cong!
                    ws.user = payload.user;
                    ws.authenticate = 1; 
                    clearTimeout(checkA);

                    requestRepo.getUnlocated().then(rows=>
                        {
                            if(rows)
                            {
                                requestRepo.setStatus(rows[0].ID,'1').then(
                                    result => {
                                        ws.currentRequest = rows[0].ID;
                                        var Data = {
                                            Request : rows[0]
                                        }
                                        sendSuccess(ws,Data);
                                    })
                            }
                            else{
                                
                                
                                
                            }
                           
                       
                        })
                   
                }
              }
          }
        }); })
        .on('push', function (data) {
      
          try { 
            requestRepo.updateAttitude(data.Latitude,data.Longitude,ws.currentRequest).then(value=>
                {
                    requestRepo.getByID(ws.currentRequest).then( request =>
                        {
                            request[0].Times = 0;
                            TXws.findDriver(request[0]);
                            requestRepo.getUnlocated().then(rows=>
                                {
                                    requestRepo.setStatus(rows[0].ID,'1').then(
                                        varr => {
                                            ws.currentRequest = rows[0].ID;
                                            var Data = {
                                                Request : rows[0]
                                            }
                                            sendSuccess(ws,Data);
                                      
                                        })
                               
                                })       
                        } )
                   
                });
                         
          }
          catch(error) {
            console.error(error);
          }

        });

        ws.on('close', msg => {
            if(ws.currentRequest !=-1)
            {
                requestRepo.setStatus(ws.currentRequest,0);
            }
            clients--;
            console.log(`close DVV (${clients} is online)`);
            clearTimeout(checkA);
        });
      
    });

    console.log(`DVV running on port ${SOCKET_PORT}`);
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