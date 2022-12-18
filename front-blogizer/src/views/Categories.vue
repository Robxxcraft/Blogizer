<template>
    <Navigation />
    <main class="py-14 md:py-20 bg-gray-100">
            <div class="mx-4 md:mx-16 flex flex-wrap lg:flex-nowrap md:space-x-4">
                <div class="w-full">
                    <div class="flex justify-between mb-4">
                        <div>
                            <div class="font-bold text-base md:text-xl text-gray-700 mb-2 tracking-wide">Categories</div>
                            <div class="bg-green-400 rounded-sm w-30 md:w-36 h-1"></div>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 lg:gap-4">
                        <template v-for="(category, index) in categories" :key="index">
                            <router-link :to="`/categories/${category.slug}`">
                                <div class="bg-white rounded-sm shadow-sm text-sm px-6 py-3 hover:shadow-md cursor-pointer flex">
                                    <div class="text-gray-800 hover:text-green-500 font-bold tracking-wide uppercase">{{category.name}}</div>
                                </div>
                            </router-link>
                        </template>
                    </div>
                </div>
                <!-- right sidebar -->
                <div class="right-sidebar">
                        <div class="w-full bg-white shadow-sm rounded-sm p-4 mt-6">
                            <div class="text-xl font-bold text-gray-700 mb-3">Tags</div>
                            <div class="flex items-center flex-wrap gap-2">
                                <div v-for="(tag, index) in tags" :key="index" class="px-3 py-1  text-sm border border-gray-200 rounded-sm transition hover:bg-green-500 hover:text-white">
                                    <router-link :to="`/tag/${tag.slug}`">{{tag.name}}</router-link>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
    </main>
    <Footers />
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
            api.get('/api/all/categories').then(res => {
                categories.value = res.data
            })
        })


        return { categories, tags }
    },
}
</script>