<template>




<div id="identifier" class="container  mt-5" >
<div v-if="loader" id="dim">
</div>
<div v-if="loader" id="loader">
   <div  class="col-md-12 load">
        <button  style="width:100%"  type="button" class=" alert alert-primary load">Waiting for new request!</button>
      </div>
    <div class="col-md-12 load">

    <img width="300px" src="https://media.giphy.com/media/Z56N0q0tsFC2k/giphy.gif" alt="aa">
</div>
       <div class="col-md-12 load">
         <button  v-on:click="logout"type="button" class=" col-md-12 btn btn-danger">Quit</button>
      </div>
  </div>


    <div class="row" >
      <div class="col-md-6 maps" >

        
        <div style="padding:10px">
            <div id="map"></div>
        </div>

 

      </div>
      <div class="col-md-6">

             <div class="float-right">
               <div  class="alert alert-default">Hello 
  <strong>{{this.$root.auth.user.Name}} !!!</strong> 
    <button  v-on:click="logout" type="button" class="btn btn-danger">Logout</button>
</div>
            
  
                     </div>

        <h2 class="text-uppercase mt-3 font-weight-bold ">Location identifier</h2>
        <form  @submit.prevent="sendAttitude">
          <div class="row">
            <div class="col-lg-6">
              <div class="form-group">
                 <label for="Name">Name :</label>
                <input id="Name" v-model="request.Name" type="text" class="form-control" placeholder="Name" required readonly>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="form-group">
                 <label for="Name">Phone :</label>
                <input v-model="request.Phone" type="text" class="form-control " placeholder="Phone" required readonly>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="form-group">
                 <label for="Name">Latitude :</label>
                <input v-model="request.latitude" type="text" class="form-control " placeholder="latitude" required readonly>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="form-group">
                 <label for="Name">Longitude :</label>
                <input v-model="request.longitude" type="text" class="form-control" placeholder="longitude" required readonly>
              </div>
            </div>
            <div class="col-12">
              <div class="form-group">
                 <label for="Name">Adress :</label>
                <textarea v-model="request.Adress" class="form-control" placeholder="Adress" rows="2" required readonly></textarea>
              </div>
            </div>
             <div class="col-12">
              <div class="form-group">
                 <label for="Name">Revesed adress :</label>
                <textarea v-model="request.rAdress" class="form-control" placeholder="Adress" rows="2" required readonly></textarea>
              </div>
            </div>
           
            <div class="col-12">
              <button class="btn btn-primary" type="submit">Invia</button>
            </div>
            <transition name="fade">
                          <div id="notifications" v-if="success" class=" alert alert-success">
                       
                            <strong>Success!</strong> <br>
                          <strong>Name: </strong> {{successrq.Name}}                          
                          <strong>Adress: </strong> {{successrq.Adress}}<br>
                        </div>
                         </transition>
          </div>
        </form>
       
      </div>

    </div>
</div>



      
</template>

<script>
export default {
  name: 'Identifier',
  data() {
    return {
        request: {Name : "",
        Phone: "",
        Note: "",
        Adress: "",
        latitude: 0,
        longitude: 0,
        rAdress:""},
        success: false,
        successrq:
        {Name : "",
        Phone: "",
        Note: "",
        Adress: "",
         rAdress:"",
        latitude: 0,
        longitude: 0},
        map: null,
        marker:null,
        count: 0,
        loader:true
  }
  } ,
  methods: {
    logout: function (event) {
      this.$root.auth = false;
      this.$root.ws.close();
      this.$root.ws = false;
      this.$router.push('login');
    },

      sendAttitude:  function () 
      {  this.loader=true;
        var ws = this.$root.ws;
        var request = this.request
        var a = setInterval(function(){
        
          if(ws.readyState == 1)
          {
          console.log("Ready for user!");
          var msg = {
          type: 'push',
          payload: { Latitude: request.latitude,Longitude: request.longitude }
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
        var vm=this;



      window.WebSocket = window.WebSocket || window.MozWebSocket;
           var ws = new WebSocket('ws://localhost:3002');
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

         ws.onclose = function(){};
          ws.onmessage = function(e) {
            var msg = JSON.parse(e.data);
            var data = msg.payload;
            var type=msg.type;
                        switch(type){
                case "success":
                    if(data.Request)
                    {
                    vm.count++;
                   vm.successrq =   vm.request;
                   vm.request.Name = data.Request.Name;
                   vm.request.Phone=data.Request.Phone;
                   vm.request.Adress=data.Request.Adress;
                    vm.request.rAdress=data.Request.Adress;
                   vm.request.Note=data.Request.Note;
                   vm.request.latitude = data.Request.Latitude;
                   vm.request.longitude = data.Request.Longitude;
                   if(vm.count!=1) {
                    vm.success =true;;
                     setTimeout(function (){ vm.success =false; }, 3000);
                   }
                   vm.loader=false;
                    }
                    else
                    {
                    vm.successrq =   vm.request;
                   vm.request.Name = "";
                   vm.request.Phone= "";
                   vm.request.Adress= "";
                    vm.request.rAdress= "";
                   vm.request.Note= "";
                   vm.request.latitude = 0;
                   vm.request.longitude = 0;
                   if(vm.count!=1) {
                    vm.success =true;;
                     setTimeout(function (){ vm.success =false; }, 3000);
                   }
                    }



                   break;
                default:
                break;
            }
            console.log(e);
            console.log(vm.request);
              var myLatLng = {lat: vm.request.latitude, lng: vm.request.longitude};
              vm.map.setCenter(myLatLng);
            vm.marker.setPosition(myLatLng); 
                   vm.marker.setTitle(vm.request.Adress); 
          }
          this.$root.ws = ws;




        function initMap() {                            
            var latitude = vm.request.latitude; // YOUR LATITUDE VALUE
            var longitude = vm.request.longitude; // YOUR LONGITUDE VALUE
            
            var myLatLng = {lat: latitude, lng: longitude};
             var geocoder = new google.maps.Geocoder;

            vm.map = new google.maps.Map(document.getElementById('map'), {
              center: myLatLng,
              zoom: 14,
              disableDoubleClickZoom: true, // disable the default map zoom on double click
            });
           
            // Update lat/long value of div when anywhere in the map is clicked    
            google.maps.event.addListener(vm.map,'click',function(event) {   

              vm.request.latitude = event.latLng.lat();
                   vm.request.longitude = event.latLng.lng();

                    geocoder.geocode({'location': event.latLng}, function(results, status) {

                        if (status === 'OK') {
            if (results[0]) {
              vm.request.rAdress=results[0].formatted_address;
              infowindow.setContent(results[0].formatted_address);
              infowindow.open(map, vm.marker);

              
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }



                    });
                   vm.marker.setPosition({lat:vm.request.latitude,lng:vm.request.longitude});
            });
            
            vm.marker = new google.maps.Marker({
              position: myLatLng,
              map: vm.map,
              //title: 'Hello World'
              
              // setting latitude & longitude as title of the marker
              // title is shown when you hover over the marker
              title: vm.request.Adress
            });    
            
          
            // Create new marker on single click event on the map
            /*google.maps.event.addListener(map,'click',function(event) {
                var marker = new google.maps.Marker({
                  position: event.latLng, 
                  map: map, 
                  title: event.latLng.lat()+', '+event.latLng.lng()
                });                
            });*/
        }
        initMap();


















    
    }
}
</script>
<!-- styling for the component -->
<style scoped>
   #identifier{
    background: #fff;
  padding:2%;
  margin-bottom: 3%;
     border-radius:1rem;
}

#notifications {
    word-wrap: break-word;
    max-width: 500px;
    min-width: 350px;
    text-align: center;
    position: fixed;
    z-index: 1000;
    right: 10px;
    bottom: 80px;

}
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}


@media (max-width: 575.98px) {


    #map { 
             width: 100%;
    height: 500px;      
          }   
 }


@media (min-width: 576px) {

     #map { 
             width: 100%;
    height: 500px;      
          }   
 }

@media (min-width: 768px) {

 

    #map { 
             width: 100%;
    height: 500px;      
          }   
}

@media (min-width: 992px) {
 
 
     #map { 
             width: 100%;
    height: 500px;      
          }   
}











#dim{
  padding-top:5%;
color:blue;
            height:100%;
            width:100%;
            position:fixed;
            left:0;
            top:0;
            z-index:16 !important;
            background-color:black;
            filter: alpha(opacity=80); 
-khtml-opacity: 0.80;     
-moz-opacity: 0.80;      
opacity: 0.80;          
}

#loader{
   border-radius: 10px;
   padding:10px;  
background: white ; 
  color:white;
  left: 50%;
top: 50%;
transform: translate(-50%, -50%);
  position: fixed;
 z-index:17!important;

}
.load{
  margin:0px!important;
  padding:0px!important;
}



</style>