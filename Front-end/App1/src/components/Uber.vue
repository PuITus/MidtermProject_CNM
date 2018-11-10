<template>

<div class="container contact-form">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>
             <div class="float-right">
               <div  class="alert alert-default">Hello 
  <strong>{{this.$root.auth.user.Name}} !!!</strong> 
    <button type="button" class="btn btn-danger">Logout</button>
</div>
            

                     </div>

             
            <form @submit.prevent="sendRequest">
                <h3>REQUEST RECEIVER</h3>
               <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input  v-model="request.Name" type="text" name="txtName" class="form-control" placeholder="Name *" value="" required />
                        </div>
                        <div   class="form-group">
                            <input v-model="request.Phone" type="text" name="txtPhone" class="form-control" placeholder="Phone number*" value="" required/>
                        </div>
                        <div class="form-group">
                            <input v-model="request.Note" type="text" name="txtNote" class="form-control" placeholder="Note" value="" />
                        </div>
                     
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <textarea v-model="request.Adress" name="txtAdress" class="form-control" placeholder="Request adress *" style="width: 100%; height: 150px;"required></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <input type="submit" name="btnSubmit" class="col-md-offset-4 col-md-4 btnContact" value="Send Message" />
                    </div>
                </div>
            </form>
</div>
</template>

<script>
export default {
  name: 'uber',
  data() {
    return {
    request: {Name : "",
    Phone: "",
    Note: "",
    Adress: "",}
  }
  } ,
  methods: {
    greet: function (event) {
      // `this` inside methods point to the Vue instance
     
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
          console.log(msg);
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
            console.log(e.data);
          }
          this.$root.ws = ws;

    }
    
    }
}
</script>
<!-- styling for the component -->
<style>

.contact-form{
    background: #fff;
    margin-top: 10%;
    margin-bottom: 5%;
    width: 70%;
}
.contact-form .form-control{
    border-radius:1rem;
}
.contact-image{
    text-align: center;
}
.contact-image img{
    border-radius: 6rem;
    width: 11%;
    margin-top: -3%;
    transform: rotate(29deg);
}
.contact-form form{
    padding: 14%;
}
.contact-form form .row{
    margin-bottom: -7%;
}
.contact-form h3{
    margin-bottom: 8%;
    margin-top: -10%;
    text-align: center;
    color: #0062cc;
}
.contact-form .btnContact {
    width: 50%;
    border: none;
    border-radius: 1rem;
    padding: 1.5%;
    background: #dc3545;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
}
.btnContactSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
}
</style>