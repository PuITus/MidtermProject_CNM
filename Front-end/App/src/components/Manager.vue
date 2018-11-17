<template>

<div class="container-fluid">

<div id="user-box" >
               <div style="margin-bottom:0;"  class="alert alert-default">Hello 
  <strong>{{this.$root.auth.user.Name}} !!!</strong> 
    <button  v-on:click="logout" type="button" class="btn btn-danger">Logout</button>
</div>
                     </div>



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
              <th width ="20%" class="text-center"> Adress </th>
              <th class="text-center"> Attitude </th>
              <th class="text-center"> Note </th>
              <th class="text-center"> Status </th>
            </tr>
          </thead>

          <tbody>
    
            <tr v-for="request in orderBy(requests,'ID',-1)" :key="request.ID">
              <td class="text-center">{{request.ID}}</td>
              <td class="text-center">{{request.Name}}</td>
              <td class="text-center">{{request.Phone}}</td>
              <td class="text-center">{{request.Adress}}</td>
              <td class="text-center">{{request.Latitude}}, {{request.Longitude}} </td>
              <td class="text-center">{{request.Note}}</td>
                 <td v-if="request.Status==0" class="text-center">
                  <span class="badge badge-light">New</span>
                 </td>
                 <td v-if="request.Status==1" class="text-center">
                  <span class="badge badge-primary">identifying</span>
                 </td>
                   <td v-if="request.Status==2" class="text-center">
                  <span class="badge badge-primary">Finding driver</span>
                 </td>
                  <td v-if="request.Status==3" class="text-center">
                  <span class="badge badge-warning">On the road</span>
                 </td>
                 <td v-if="request.Status==4" class="text-center">
                  <span class="badge badge-success">Finished</span>
                 </td>
                 <td v-if="request.Status==5" class="text-center">
                  <span class="badge badge-danger">No driver</span>
                 </td>
            </tr>
          </tbody>
        </table>
      </div>

   
    </div>
  </div>
</template>

<script>
export default {
  name: 'Manager',
  data() {
    return {
        requests: null,
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
          var ws = new WebSocket('ws://localhost:3004');
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
                case "init":
                    vm.requests = data.Request;
                    break;
                case "push":
                    vm.requests.push(data.Request);
                  break;
                default:
                break;
            }
            console.log(e);
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