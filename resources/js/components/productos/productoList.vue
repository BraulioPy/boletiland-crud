<script setup>
import busquedaBar from "../shared/busquedaBar.vue";
import { productoService } from "../../services/productoService.js";
import ProductoForm from "./productoForm.vue";
import { ref } from "vue";
import { onMounted } from "vue";
const productos = ref([]);
const mostrarForm = ref(false);
const busquedaEnVista = ref("");
const productoSeleccionado = ref(null);
const paginaActual = ref(1);
const ultimaPagina = ref(1);

const cargarProductos = async (busqueda = "") => {
    busquedaEnVista.value = busqueda;
    const response = await productoService.getAll(busqueda, paginaActual.value);
    productos.value = response.data.data;
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
const eliminarProducto = async (id) => {
    await productoService.delete(id);
    cargarProductos(busquedaEnVista.value);
};
onMounted(cargarProductos);
</script>
<template>
    <div class="flex flex-col w-full h-full max-h-screen bg-zinc-50">
        <h2 class="text-xl font-bold text-zinc-800 text-center shrink-0 mb-4">
            Productos
        </h2>

        <div
            class="flex flex-col flex-1 w-full max-w-5xl mx-auto bg-zinc-100 border border-zinc-200 rounded-lg overflow-hidden"
        >
            <div class="flex flex-wrap p-4 items-center justify-end gap-3 mr-2">
                <busquedaBar
                    @busqueda="cargarProductos"
                    class="shrink-0 border-b justify-end border-zinc-200"
                ></busquedaBar>
                <button
                    class="px-4 py-2 text-sm font-semibold text-white bg-teal-600 rounded-md hover:bg-teal-700 transition-colors"
                    @click="abrirCrear"
                >
                    Nuevo Producto
                </button>
            </div>

            <div class="flex-1 overflow-y-auto bg-white">
                <table class="w-full text-left text-sm text-zinc-600">
                    <thead
                        class="sticky top-0 bg-zinc-100 text-zinc-900 font-semibold border-b border-zinc-200 z-10"
                    >
                        <tr>
                            <th class="px-6 py-4">ID</th>
                            <th class="px-6 py-4">Nombre del Producto</th>
                            <th class="px-6 py-4">Precio</th>
                            <th class="px-6 py-4 text-right">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-zinc-200">
                        <tr
                            v-for="producto in productos"
                            :key="producto.id"
                            v-if="productos.length > 0"
                            class="hover:bg-zinc-50 transition-colors"
                        >
                            <td class="px-6 py-4 font-medium text-zinc-900">
                                {{ producto.id }}
                            </td>
                            <td class="px-6 py-4">{{ producto.nombre }}</td>
                            <td class="px-6 py-4">{{ producto.precio }}</td>
                            <td class="px-6 py-4 flex justify-end gap-3">
                                <button
                                    class="text-zinc-400 hover:text-blue-600 transition-colors"
                                    title="Editar"
                                    @click="abrirEditar(producto.id)"
                                >
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        fill="none"
                                        viewBox="0 0 24 24"
                                        stroke-width="1.5"
                                        stroke="currentColor"
                                        class="w-5 h-5 text-zinc-400 hover:text-blue-600 transition-colors"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10"
                                        />
                                    </svg>
                                </button>
                                <button
                                    class="text-zinc-400 hover:text-red-600 transition-colors"
                                    title="Eliminar"
                                    @click="eliminarProducto(producto.id)"
                                >
                                    <svg
                                        class="w-5 h-5"
                                        fill="none"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                                        ></path>
                                    </svg>
                                </button>
                            </td>
                        </tr>
                        <tr v-else>
                            <td colspan="4" class="px-6 py-12 text-center">
                                <div
                                    class="flex flex-col items-center justify-center gap-3"
                                >
                                    <p class="text-zinc-500 font-medium">
                                        No hay productos registrados con:
                                    </p>
                                    <p class="text-zinc-500 font-medium">
                                        ' {{ busquedaEnVista }} '
                                    </p>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <ProductoForm
                    :visible="mostrarForm"
                    :producto="productoSeleccionado"
                    @cerrar="mostrarForm = false"
                    @guardado="cargarProductos(busquedaEnVista)"
                />
            </div>
        </div>

        <div class="flex justify-center items-center gap-4 shrink-0 mt-4">
            <button
                :disabled="paginaActual === 1"
                @click="
                    paginaActual--;
                    cargarProductos();
                "
                class="px-4 py-2 text-sm font-semibold text-white bg-zinc-800 rounded-md hover:bg-zinc-900 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
                Anterior
            </button>
            <span class="text-sm font-medium text-zinc-600">
                {{ paginaActual }} / {{ ultimaPagina }}
            </span>
            <button
                :disabled="paginaActual === ultimaPagina"
                @click="
                    paginaActual++;
                    cargarProductos();
                "
                class="px-4 py-2 text-sm font-semibold text-white bg-zinc-800 rounded-md hover:bg-zinc-900 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
            >
                Siguiente
            </button>
        </div>
    </div>
</template>
