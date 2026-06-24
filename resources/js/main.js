import { createApp } from "vue";
import axios from "axios";
import App from "./App.vue";

//Usaré esta url para manejar las peticiones con axios que es la que abre mi puerto
axios.defaults.baseURL = import.meta.env.VITE_API_URL;

window.axios = axios;
createApp(App).mount('#app');