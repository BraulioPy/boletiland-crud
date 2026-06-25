import { createApp } from "vue";
import axios from "axios";
import App from "./App.vue";
import router from "./router/index.js";

//Usaré esta url para manejar las peticiones con axios que es la que abre mi puerto
axios.defaults.baseURL = import.meta.env.VITE_API_URL;

window.axios = axios;
createApp(App).use(router).mount('#app');