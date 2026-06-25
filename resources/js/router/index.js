import { createRouter, createWebHistory } from "vue-router";
import productoList from "../components/productos/productoList.vue";
import compraList from "../components/compras/compraList.vue";
const routes = [
    {path:'/productos', component: productoList},
    {path:'/compras', component: compraList},
    {path:'/', redirect:'/productos'},
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;