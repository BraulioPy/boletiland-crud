<script setup>
import { ref, watch } from "vue";
import { productoService } from "../../services/productoService";
import MensajeError from "../shared/mensajeError.vue";

const parametrosComponente = defineProps({
    visible: Boolean,
    producto: Number,
});

const emit = defineEmits(["cerrar", "guardado"]);
const errorValidacion = ref("");
const form = ref({ nombre: "", precio: "" });

watch(
    () => parametrosComponente.visible,
    (valor) => {
        if (!valor) errorValidacion.value = "";
    },
);
watch(
    () => parametrosComponente.producto,
    async (id) => {
        if (id) {
            const response = await productoService.getById(id);
            form.value = {
                nombre: response.data.nombre,
                precio: response.data.precio,
            };
        } else {
            form.value = { nombre: "", precio: "" };
        }
    },
);
async function guardar() {
    errorValidacion.value = "";
    try {
        if (!form.value.nombre || !form.value.precio) {
            errorValidacion.value =
                "Por favor, completa todos los campos obligatorios.";
            return;
        }
        if (parametrosComponente.producto) {
            await productoService.update(
                parametrosComponente.producto,
                form.value,
            );
        } else {
            await productoService.create(form.value);
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
                {{ producto ? "Editar Producto" : "Nuevo Producto" }}
            </h2>

            <div class="flex flex-col gap-3">
                <input
                    v-model="form.nombre"
                    type="text"
                    placeholder="Nombre del producto"
                    class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                />
                <input
                    v-model="form.precio"
                    type="number"
                    placeholder="Precio"
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
