<script setup>
import busquedaBar from "../shared/busquedaBar.vue";
import { compraService } from "../../services/compraService.js";
import compraForm from "./compraForm.vue";
import { ref, onMounted } from "vue";
const compras = ref([]);
const mostrarForm = ref(false);
const busquedaEnVista = ref("");
const compraSeleccionada = ref(null);
const paginaActual = ref(1);
const ultimaPagina = ref(1);

const cargarCompras = async (busqueda = "") => {
    busquedaEnVista.value = busqueda;
    const response = await compraService.getAll(busqueda, paginaActual.value);
    compras.value = response.data.data;
    ultimaPagina.value = response.data.last_page;
};
function abrirEditar(id) {
    productoSeleccionado.value = id;
    mostrarForm.value = true;
}
function abrirCrear() {
    productoSeleccionado.value = null;
    mostrarForm.value = true;
}
const eliminarCompra = async (id) => {
    await compraService.delete(id);
    cargarCompras(busquedaEnVista.value);
};
</script>
<template>
    <div
        class="flex flex-col items-center justify-center gap-4 w-full h-full text-center"
    >
        <h2 class="text-xl font-bold text-zinc-800">Compras Realizadas</h2>

        <div
            class="w-full max-w-md bg-zinc-100 border border-zinc-200 rounded-lg h-32 flex items-center justify-center text-zinc-400"
        >
            <BusquedaBar></BusquedaBar>
        </div>
    </div>
</template>
