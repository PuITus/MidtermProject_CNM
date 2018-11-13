<template>

<div class="container contact-form">
            <div class="contact-image">
                <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
            </div>

             <div class="float-right">
               <div  class="alert alert-default">Hello 
  <strong>{{this.$root.auth.user.Name}} !!!</strong> 
    <button  v-on:click="logout" type="button" class="btn btn-danger">Logout</button>
</div>
            
  
                     </div>
  
          
            <form id = "requestfrm" @submit.prevent="sendRequest">
        <div >
          <div class="col-md-12">
               <h3 style="text-align:center;margin-bottom:5%" class="text-uppercase mt-3 font-weight-bold"> REQUEST RECEIVER </h3></div>
            </div>
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
                            <textarea v-model="request.Adress" name="txtAdress" class="form-control" placeholder="Request adress *" style="width: 100%; height: 150px;" required></textarea>
                        </div>
                    
                    </div>
                    
                     <div  style="margin-top:20px" class="col-md-12">
                       <transition name="fade">
                          <div id="notifications" v-if="success" class=" alert alert-success">
                       
                            <strong>Success!</strong> <br>
                          <strong>Name: </strong> {{successrq.Name}}                          <strong>Adress: </strong> {{successrq.Adress}}<br>
                        </div>
                         </transition>
                    </div>
                   <div class="col-md-12">
                        <input type="submit" name="btnSubmit" class=" offset-md-8 col-md-4 btnContact" value="Send Request" />
                    </div>
                </div>

            </form>

</div>
</template>


<!-- styling for the component -->
<style >
#notifications {
    word-wrap: break-word;
    max-width: 450px;
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
.contact-form{
    background: #fff;
    margin-top: 5%;
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
    padding: 12%;
    padding-top:8%;
}
.contact-form form .row{
    margin-bottom: -7%;
}

.contact-form .btnContact {
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
   
    border-radius: 1rem;
    padding: 1.5%;
    color: #fff;
    background-color: #0062cc;
    border: none;
    cursor: pointer;
}
</style>