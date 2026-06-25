<script setup>
import busquedaBar from "../shared/busquedaBar.vue";
</script>
<template>
    <div
        class="flex flex-col items-center justify-center gap-4 w-full h-full text-center"
    >
        <h2 class="text-xl font-bold text-zinc-800">Productos</h2>

        <div
            class="w-full max-w-md bg-zinc-100 border border-zinc-200 rounded-lg h-32 flex items-center justify-center text-zinc-400"
        >
            <busquedaBar></busquedaBar>
        </div>
    </div>
</template>
