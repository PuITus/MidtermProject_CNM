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
         <button  v-on:click="logout" type="button" class=" col-md-12 btn btn-danger">Quit</button>
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