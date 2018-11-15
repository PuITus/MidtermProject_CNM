<template>

<div class="container-fluid">
    <div class="panel panel-success">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-3">
            <h2 class="text-center pull-left" style="padding-left: 30px;"> <span class="glyphicon glyphicon-list-alt"> </span> Request list </h2>
          </div>
        </div>
      </div>

      <div class="panel-body table-responsive">
        <table class="table table-hover">
          <thead>
            <tr>
              <th class="text-center"> No. </th>
              <th class="text-center"> Name </th>
              <th class="text-center"> Phone </th>
              <th width ="30%" sclass="text-center"> Adress </th>
              <th class="text-center"> Note </th>
              <th class="text-center"> Status </th>
            </tr>
          </thead>

          <tbody>
            <tr class="edit" id="detail">
              <td id="no" class="text-center"> 1 </td>
              <td id="name" class="text-center"> ABC </td>
              <td id="mobile" class="text-center"> 5412547854 </td>
              <td id="mail" class="text-center"> abc@gmail.com </td>
              <td id="city" class="text-center"> New York </td>
                 <td class="text-center">  </td>
            </tr>

            <tr>
              <td class="text-center"> 2 </td>
              <td class="text-center"> DFG </td>
              <td class="text-center"> 4025478965 </td>
              <td class="text-center"> dfg@gmail.com </td>
              <td class="text-center"> Los Angelos </td>
                 <td class="text-center">  </td>
            </tr>

            <tr>
              <td class="text-center"> 3 </td>
              <td class="text-center"> XYZ </td>
              <td class="text-center"> 4102369745 </td>
              <td class="text-center"> xyz@gmail.com </td>
              <td class="text-center"> Las Vegas </td>
                 <td class="text-center">  </td>
            </tr>

            <tr>
              <td class="text-center"> 4 </td>
              <td class="text-center"> JKL </td>
              <td class="text-center"> 2536541028 </td>
              <td class="text-center"> jkl@gmail.com </td>
              <td class="text-center"> California </td>
               <td class="text-center">  </td>
            </tr>

            <tr>
              <td class="text-center"> 5 </td>
              <td class="text-center"> DFG </td>
              <td class="text-center"> 4025478965 </td>
              <td class="text-center"> dfg@gmail.com </td>
              <td class="text-center"> Los Angelos </td>
                 <td class="text-center">  </td>
            </tr>
          </tbody>
        </table>
      </div>

   
    </div>
  </div>
</template>

<script>
export default {
  name: 'Receiver',
  data() {
    return {
        request: {Name : "",
        Phone: "",
        Note: "",
        Adress: "",},
    success: false,
        successrq:
        {Name : "",
        Phone: "",
        Note: "",
        Adress: "",}
  }
  } ,
  methods: {
    logout: function (event) {
      this.$root.auth = false;
        this.$root.ws.close();
      this.$root.ws = false;
      this.$router.push('login');
    },

      sendRequest:  function () 
      {
        var ws = this.$root.ws;
        var request = this.request
        var a = setInterval(function(){
        
          if(ws.readyState == 1)
          {
          console.log("Ready for user!");
          var msg = {
          type: 'push',
          payload: { Request: {Name:request.Name, Phone:request.Phone,Adress:request.Adress,Note:request.Note} }
          };
          ws.send(JSON.stringify(msg));
          
            clearInterval(a);
          }
          else
          {
              console.log("loading...");
                  console.log(ws.readyState);
          }     
        }, 500);
      }

  },
   created()
    {
      if(this.$root.auth == false)
      {
        alert("Please login first!!");
         this.$router.push('login');
      }
    },
    mounted()
    {
          if(this.$root.auth)
    {
      var vm = this;
      window.WebSocket = window.WebSocket || window.MozWebSocket;
          var ws = new WebSocket('ws://localhost:3001');
          var Token = this.$root.auth.access_token;
          ws.onopen = function() {
            console.log('connected');
            //Data khi authen
                    var msg = {
                    type: 'authenticate',
                    payload: { Token: Token }
                    };
            this.send(JSON.stringify(msg));
            //Data khi push request lên
          
          }

         
          ws.onmessage = function(e) {
            var msg = JSON.parse(e.data);
            var data = msg.payload;
            var type=msg.type;
                        switch(type){
                case "success":
                   vm.successrq = data.Request;
                   vm.request.Name ="";
                   vm.request.Phone="";
                   vm.request.Adress="";
                   vm.request.Note="";
                     vm.success =true;
                     setTimeout(function (){ vm.success =false; }, 3000);
                   break;
                default:
                break;
            }
           
          }
          this.$root.ws = ws;

    }
    
    }
}
</script>
<!-- styling for the component -->
<style > .panel
        {
          margin: 5%;
          background: white;
          border-radius:5px;
        }


        tr
        {
          transition: all 0.5s;
        }
        tr:hover
        {
          background-color: #f0ad4e;
          transition: 0.5s;
        }
        .btn-warning
        {
          transition: all 0.8s;
        }

        .btn-warning:hover, .btn-warning:focus
        {
          transition: 0.8s;
          background-color: #428bca;
          border-color: #428bca;
        }

        .panel-footer
        {
          background-color: #5bc0de;
          color: white;
        }
</style>