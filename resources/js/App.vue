<script setup></script>
<template>
    <div class="bg-zinc-50 min-h-screen pb-6">
        <div class="w-full max-w-7xl mx-auto pt-4 px-6 flex flex-col">
            <nav
                class="flex flex-wrap items-center gap-10 p-4 bg-zinc-100 border border-zinc-200 rounded-t-lg"
            >
                <h1 class="text-xl font-bold text-zinc-900">
                    CRUD Productos-Compras
                </h1>

                <div class="flex gap-6">
                    <RouterLink
                        to="/productos"
                        class="text-base font-semibold text-zinc-600 hover:text-zinc-900 transition-colors"
                    >
                        Productos
                    </RouterLink>

                    <RouterLink
                        to="/compras"
                        class="text-base font-semibold text-zinc-600 hover:text-zinc-900 transition-colors"
                    >
                        Compras
                    </RouterLink>
                </div>
            </nav>

            <div
                class="p-6 bg-white border-x border-b border-zinc-200 rounded-b-lg"
            >
                <div class="space-y-4">
                    <main
                        class="p-4 w-full bg-zinc-50 rounded border border-zinc-200"
                    >
                        <RouterView class="items-center"></RouterView>
                    </main>
                </div>
            </div>
        </div>
    </div>
</template>
