<script setup>
import { ref, watch } from "vue";
import { compraService } from "../../services/compraService";
import { productoService } from "../../services/productoService";
import MensajeError from "../shared/mensajeError.vue";

const parametrosComponente = defineProps({
    visible: Boolean,
    compra: Number,
});
const errorValidacion = ref("");
const busquedaProducto = ref("");
const resultadosProductos = ref([]);
const productoSeleccionado = ref(null);
const emit = defineEmits(["cerrar", "guardado"]);
const form = ref({ nombre_comprador: "", producto_id: "", cantidad: "" });

async function lanzarBusquedaProductos(busqueda) {
    const productos = await productoService.getAll(busqueda);
    resultadosProductos.value = productos.data.data;
}
function seleccionarProducto(producto) {
    productoSeleccionado.value = producto;
    form.value.producto_id = producto.id;
    busquedaProducto.value = producto.id;
    resultadosProductos.value = [];
}
watch(
    () => parametrosComponente.visible,
    (valor) => {
        if (!valor) {
            errorValidacion.value = "";
            resultadosProductos.value = [];
        }
    },
);
watch(
    () => parametrosComponente.compra,
    async (id) => {
        if (id) {
            const response = await compraService.getById(id);
            form.value = {
                nombre_comprador: response.data.nombre_comprador,
                producto_id: response.data.producto_id,
                cantidad: response.data.cantidad,
            };
            busquedaProducto.value = response.data.producto_id;
        } else {
            form.value = {
                nombre_comprador: "",
                producto_id: "",
                cantidad: "",
            };
            busquedaProducto.value = "";
        }
    },
);
async function guardar() {
    errorValidacion.value = "";
    try {
        if (
            !form.value.nombre_comprador ||
            !form.value.producto_id ||
            !form.value.cantidad
        ) {
            errorValidacion.value =
                "Por favor, completa todos los campos obligatorios.";
            return;
        }
        if (parametrosComponente.compra) {
            await compraService.update(parametrosComponente.compra, form.value);
        } else {
            await compraService.create(form.value);
        }
        emit("guardado");
        emit("cerrar");
    } catch (error) {
        errorValidacion.value = "Error al completar el registro";
    }
}
</script>
<template>
    <div
        v-if="visible"
        class="fixed inset-0 flex items-center justify-center p-4 z-50"
    >
        <div
            class="absolute inset-0 bg-zinc-900/40 backdrop-blur-sm"
            @click="$emit('cerrar')"
        ></div>

        <div
            class="relative bg-white rounded-xl shadow-lg w-full max-w-sm p-6 flex flex-col gap-4"
        >
            <h2 class="text-lg font-bold text-zinc-900">
                {{
                    compra
                        ? "Editar Registro - Compra"
                        : "Crear Registro - Compra"
                }}
            </h2>

            <div class="flex flex-col gap-3">
                <span>Nombre Comprador:</span>
                <input
                    v-model="form.nombre_comprador"
                    type="text"
                    placeholder="Nombre del comprador:"
                    class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                />
                <span>ID Producto:</span>
                <div class="flex flex-row">
                    <input
                        v-model="busquedaProducto"
                        type="text"
                        placeholder="Buscar producto por nombre o ID:"
                        class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                    />
                    <button
                        class="p-2 text-zinc-600 hover:text-zinc-900 rounded-md transition-colors"
                        @click="lanzarBusquedaProductos(busquedaProducto)"
                    >
                        <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke-width="2"
                            stroke="currentColor"
                            class="w-5 h-5"
                        >
                            <path
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z"
                            />
                        </svg>
                    </button>
                </div>
                <ul
                    v-if="resultadosProductos.length"
                    class="absolute z-10 w-full bg-white border border-zinc-200 rounded-md shadow-md mt-1 max-h-40 overflow-y-auto"
                >
                    <li
                        v-for="producto in resultadosProductos"
                        :key="producto.id"
                        @click="seleccionarProducto(producto)"
                        class="px-3 py-2 text-sm text-zinc-700 hover:bg-zinc-100 cursor-pointer flex gap-2"
                    >
                        <span class="text-zinc-400 shrink-0"
                            >#{{ producto.id }}</span
                        >
                        <span class="truncate">{{ producto.nombre }}</span>
                    </li>
                </ul>
                <span>Cantidad a Vender:</span>
                <input
                    v-model="form.cantidad"
                    type="number"
                    placeholder="Cantidad a vender:"
                    class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                />
            </div>
            <MensajeError :mensaje="errorValidacion"></MensajeError>
            <div class="flex justify-end gap-2 mt-2">
                <button
                    @click="$emit('cerrar')"
                    class="px-4 py-2 text-sm font-medium text-zinc-600 hover:bg-zinc-100 rounded-md transition-colors"
                >
                    Cancelar
                </button>
                <button
                    @click="guardar"
                    class="px-4 py-2 text-sm font-semibold text-white bg-zinc-800 hover:bg-zinc-900 rounded-md transition-colors"
                >
                    Guardar
                </button>
            </div>
        </div>
    </div>
</template>
