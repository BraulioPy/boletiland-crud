<script setup>
</script>
<template>
    <div>
        <nav>
            <RouterLink to="/productos">Productos</RouterLink>
            <RouterLink to="/compras">Compras</RouterLink>
        </nav>
    </div>
    <main>
        <RouterView/>
    </main>
</template>