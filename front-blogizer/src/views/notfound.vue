<template>
    <div class="overflow-hidden">
        <Navigation />
        <main class="py-14 md:py-20 bg-gray-100">
            <div class="mx-4 md:mx-16 flex flex-wrap lg:flex-nowrap md:space-x-4">
                <div class="w-full">
                    <div class="flex flex-col items-center">
                        <img src="../assets/notfound.svg" width="400" height="400">
                        <div class="text-lg md:text-xl text-gray-700 font-bold tracking-wide uppercase">Page not found</div>
                        <div class="text-sm md:text-base text-gray-400">
                            We couldn't find the page you're looking for.
                        </div>
                        <router-link to="/">
                            <div class="flex bg-emerald-500 hover:bg-green-600 shadow-sm rounded text-white px-4 py-2 mt-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.25" stroke-linecap="round" stroke-linejoin="round"><path d="M20 9v11a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V9" /><path d="M9 22V12h6v10M2 10.6L12 2l10 8.6" /></svg>
                            </div>
                        </router-link>
                    </div>
                </div>
                <!-- right sidebar -->
                <div class="right-sidebar">
                    <div class="w-full h-auto bg-white shadow-sm rounded-sm p-4 ">
                            <div class="text-xl font-bold text-gray-700 mb-3">Categories</div>
                            <div class="space-y-2">
                                <template v-for="(category, index) in categories" :key="index">
                                <router-link :to="`/categories/${category.slug}`">
                                <div class="flex mb-1 items-center text-gray-800 font-bold text-sm uppercase transition hover:text-emerald-500">
                                    <div class="mr-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4 5v14h16V7h-8.414l-2-2H4zm8.414 0H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2z"/></svg>
                                    </div>
                                    <div>{{category.name}}</div>
                                    <div class="ml-auto text-sm px-2 py-auto border border-green-200 rounded-full bg-green-100 text-green-800">{{category.count}}</div>
                                </div>
                                </router-link>
                                </template>

                                <div class="flex items-center text-gray-700 font-semibold text-sm uppercase transition hover:text-emerald-500">
                                    See More...
                                </div>
                            </div>
                        </div>
                        <div class="w-full bg-white shadow-sm rounded-sm p-4 mt-6">
                            <div class="text-xl font-bold text-gray-700 mb-3">Tags</div>
                            <div class="flex items-center flex-wrap gap-2">
                                <div v-for="(tag, index) in tags" :key="index" href="#" class="px-3 py-1  text-sm border border-gray-200 rounded-sm transition hover:bg-emerald-500 hover:text-white">
                                    <router-link :to="`/tag/${tag.slug}`">{{tag.name}}</router-link>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </main>
        <Footers />
    </div>
</template>

<script>
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import { ref } from '@vue/reactivity';
import api from '../axios';
import { onMounted } from '@vue/runtime-core';
export default {
    components: {
        Navigation,
        Footers
    },
    setup() {
        const categories = ref([])
        const tags = ref([])
        onMounted(() => {
            api.get('/api/home/tags').then(res => {
                tags.value = res.data.data
            })
            api.get('/api/home/categories').then(res => {
                categories.value = res.data.data
            })
        })
        return { categories, tags }
    },
}
</script>