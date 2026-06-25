<script setup>
defineProps({ mensaje: String });
</script>

<template>
    <div v-if="mensaje" class="w-full">
        <span
            class="block text-red-600 text-sm font-medium bg-red-50 px-3 py-2 rounded-md border border-red-200"
        >
            {{ mensaje }}
        </span>
    </div>
</template>
