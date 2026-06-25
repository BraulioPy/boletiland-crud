<script setup>
import { ref } from "vue";
const texto = ref("");
const emit = defineEmits(["busqueda"]);
function ejecutarBusqueda() {
    emit("busqueda", texto.value);
}
</script>
<template>
    <div class="flex items-center gap-2">
        <input
            v-model="texto"
            type="text"
            placeholder="Buscar por..."
            class="w-full max-w-sm px-4 py-2 text-sm text-zinc-800 bg-white border border-zinc-300 rounded-md placeholder-zinc-400 focus:outline-none focus:border-zinc-500 focus:ring-1 focus:ring-zinc-500 transition-shadow"
        />
        <button
            @click="ejecutarBusqueda"
            class="px-4 py-2 text-sm font-semibold text-white bg-zinc-800 rounded-md hover:bg-zinc-900 transition-colors"
        >
            Buscar
        </button>
    </div>
</template>
