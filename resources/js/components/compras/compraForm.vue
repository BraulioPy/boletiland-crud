<script setup>
import { ref, watch } from "vue";
import { compraService } from "../../services/compraService";

const parametrosComponente = defineProps({
    visible: Boolean,
    compra: Number,
});
const emit = defineEmits(["cerrar", "guardado"]);
const form = ref({ nombre_comprador: "", producto_id: "", cantidad: "" });
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
        } else {
            form.value = {
                nombre_comprador: "",
                producto_id: "",
                cantidad: "",
            };
        }
    },
);
async function guardar() {
    if (parametrosComponente.compra) {
        await compraService.update(parametrosComponente.compra, form.value);
    } else {
        await compraService.create(form.value);
    }
    emit("guardado");
    emit("cerrar");
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
                <input
                    v-model="form.nombre_comprador"
                    type="text"
                    placeholder="Nombre del comprador:"
                    class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                />
                <input
                    v-model="form.producto_id"
                    type="number"
                    placeholder="ID del producto vendido:"
                    class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                />
                <input
                    v-model="form.cantidad"
                    type="number"
                    placeholder="Cantidad a vender:"
                    class="w-full px-3 py-2 border border-zinc-300 rounded-md focus:outline-none focus:ring-2 focus:ring-zinc-400"
                />
            </div>

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
