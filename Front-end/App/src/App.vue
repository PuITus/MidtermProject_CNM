<template>
  <div id="app">

  <!-- the router outlet, where all matched components would ber viewed -->
<!--   <router-link v-bind:to="'/'">Home</router-link>
<router-link v-bind:to="'/uber'">Uber</router-link>
<router-link v-bind:to="'/login'">Login</router-link> -->
    <router-view></router-view>
  </div>
</template>

<script>

export default {
  name: 'app'
}
</script>
<!-- styling for the component -->
<style >
body{
background: linear-gradient(to bottom, #FFB88C, #DE6262)  center fixed; 
}
#user-box
{
background: #fff;
            border: #DCDBD7 1px solid;
            border-radius: 10px; z-index:99;    position: fixed; right:10px; top: 10px;
}  

</style>
