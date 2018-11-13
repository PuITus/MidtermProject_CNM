// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
//import the vue instance
import Vue from 'vue'
//import the App component
import App from './App'
//import the vue router
import VueRouter from 'vue-router'
//tell vue to use the router
Vue.use(VueRouter)
/* eslint-disable no-new */


import Hello from './components/Hello'
import Login from './components/Login'
import Receiver from './components/Receiver'
import Identifier from './components/Identifier'

//define your routes
const routes = [

	{ path: '/', component: Login },
  { path: '/login', component: Login },
	{ path: '/receiver', component: Receiver },
  { path: '/identifier', component: Identifier }
]

// Create the router instance and pass the `routes` option
// You can pass in additional options here, but let's
// keep it simple for now.
const router = new VueRouter({
  routes, // short for routes: routes
  mode: 'history'
})
//instatinat the vue instance
new Vue({
	//define the selector for the root component
  el: '#app',
  //pass the template to the root component
  template: '<App/>',
  //declare components that the root component can access
  components: { App },
  data: {
    auth: false,
    ws: false
  },
  //pass in the router to the vue instance
  router
}).$mount('#app')//mount the router on the app