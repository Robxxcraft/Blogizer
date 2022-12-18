import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import './assets/tailwind.css'
import clickOutside from './click-outside'
import './chart'

createApp(App).directive('click-outside', clickOutside).use(router).mount('#app')