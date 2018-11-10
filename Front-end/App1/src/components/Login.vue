
<template>

<section class="login-block">
    <div class="container">
  <div class="row">
    <div class="col-md-4 login-sec">
        <h2 class="text-center">Request receiver Login</h2>
        <form @submit.prevent="doLogin" class="login-form">
  <div class="form-group">
    <label class="text-uppercase">Username</label>
    <input  v-model="username"  type="text" class="form-control" placeholder="">
    
  </div>
  <div class="form-group">
    <label class="text-uppercase">Password</label>
    <input v-model="password"  type="password" class="form-control" placeholder="">
  </div>
  <div v-if="fail" class="alert alert-danger">
  <strong>Oops!</strong> your infomation is wrong!!
</div>
  
    <div class="form-check">
   
    <button id="submit-btn" type="submit" class=" btn btn-login col-md-offset-4 col-md-4">Login</button>
  </div>
  
</form>
<div class="copy-text">Request receiver App <i class="fa fa-heart"></i> by Uber</div>
    </div>
    <div class="col-md-8 banner-sec">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                 <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  </ol>
            <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img class="d-block img-fluid" src="https://static.pexels.com/photos/33972/pexels-photo.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>This is Heaven</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
        </div>  
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block img-fluid" src="https://images.pexels.com/photos/7097/people-coffee-tea-meeting.jpg" alt="First slide">
      <div class="carousel-caption d-none d-md-block">
        <div class="banner-text">
            <h2>This is Heaven</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
        </div>  
    </div>
    </div>
            </div>     
        
    </div>
  </div>
</div>
</div>
</section>
</template>
























<script>
export default {
  name: 'login-box',
  data () {
    return {  username: '',
      password: '',
      hidePassword: true,
      fail: false,
      msg: 'Welcome to Your Vue.js App'
    }
  },
  computed: {
      passwordType() {
        return this.hidePassword ? 'password' : 'text'
      },
      passwordIcon() {
        return this.hidePassword ? 'fa-eye' : 'fa-eye-slash'
      }
    },
      methods: {
        test()
        {
    console.log($("#submit-btn").html());
     
        },
         doLogin(event)
         {
          var auth;
         if(this.password =="1") alert("ok");
           $.ajax({
                    url : "http://localhost:3000/api/users/login",
                    type : "post",
                    dataType:"json",
                    data : {
                         user : this.username,
                         pwd: this.password
                    },
                    success : function (result){
                      auth = result;
                    }
                }).then(value=>
                {
                  if(auth.auth)
                  {this.$root.auth = auth;
                    this.fail = false;
                    this.$router.push('uber');
                  } else 
                  {
                    this.fail = true;
                  this.username ="";
                  this.password="";
                  }
                });

         }   
    },created()
    {
      if(this.$root.auth != false)
      {
        alert("Already logged in!!");
         this.$router.push('uber');
      }
    },
    mounted()
    {
      // console.log($("#submit-btn").html("test"));
     
    }

}
</script>

<style scoped>
.login-block{
  padding : 60px 0;
}
.banner-sec{background:url(https://static.pexels.com/photos/33972/pexels-photo.jpg)  no-repeat left bottom; background-size:cover; min-height:500px; border-radius: 0 10px 10px 0; padding:0;}
.container{background:#fff; border-radius: 10px; box-shadow:15px 20px 0px rgba(0,0,0,0.1);}
.carousel-inner{border-radius:0 10px 10px 0;}
.carousel-caption{text-align:left; left:5%;}
.login-sec{padding: 50px 30px; position:relative;}
.login-sec .copy-text{position:absolute; width:80%; bottom:20px; font-size:13px; text-align:center;}
.login-sec .copy-text i{color:#FEB58A;}
.login-sec .copy-text a{color:#E36262;}
.login-sec h2{margin-bottom:30px; font-weight:800; font-size:30px; color: #DE6262;}
.login-sec h2:after{content:" "; width:100px; height:5px; background:#FEB58A; display:block; margin-top:20px; border-radius:3px; margin-left:auto;margin-right:auto}
.btn-login{background: #DE6262; color:#fff; font-weight:600; }
.banner-text{width:70%; position:absolute; bottom:40px; padding-left:20px;}
.banner-text h2{color:#fff; font-weight:600;}
.banner-text h2:after{content:" "; width:100px; height:5px; background:#FFF; display:block; margin-top:20px; border-radius:3px;}
.banner-text p{color:#fff;}
</style>