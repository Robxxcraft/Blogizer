<script setup>
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import PostsList from "../components/PostsList.vue";
import { ref } from '@vue/reactivity';
import api from '../axios';
import { onMounted } from '@vue/runtime-core';

const categories = ref([])
const categorySloading = ref(false)
const tags = ref([])
onMounted(() => {
    api.get('/api/home/tags').then(res => {
        tags.value = res.data.data
    })
    categorySloading.value = true
    api.get('/api/home/categories').then(res => {
        categories.value = res.data.data
        categorySloading.value = false
    })
})
</script>

<template>
    <div class="overflow-hidden">
        <Navigation />
        <main class="py-14 md:py-20 bg-gray-100">
            <div class="mx-4 md:mx-16 flex flex-wrap lg:flex-nowrap md:space-x-4">
                <div class="mb-8">
                    <PostsList url="popular">
                        <template v-slot:title>
                            <div>
                                <div class="font-bold text-base md:text-xl text-gray-700 mb-2 tracking-wide">Popular Posts</div>
                                <div class="bg-emerald-500 rounded-sm w-30 md:w-36 h-1"></div>
                            </div>
                        </template>
                    </PostsList>
                </div>
                <!-- right sidebar -->
                <div class="right-sidebar w-full">
                    <div class="bg-white shadow-sm rounded-sm p-4">
                            <div class="text-xl font-bold text-gray-700 mb-3">Categories</div>
                            <template v-if="!categorySloading">
                                <div class="space-y-2">
                                    <div v-for="(category, index) in categories" :key="index">
                                    <router-link :to="`/categories/${category.slug}`">
                                    <div class="flex mb-1 items-center text-gray-800 font-bold text-sm uppercase transition hover:text-emerald-500">
                                        <div class="mr-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4 5v14h16V7h-8.414l-2-2H4zm8.414 0H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2z"/></svg>
                                        </div>
                                        <div>{{category.name}}</div>
                                        <div class="ml-auto text-sm px-2 py-auto border border-green-200 rounded-full bg-green-100 text-green-800">{{category.count}}</div>
                                    </div>
                                    </router-link>
                                    </div>

                                    <div class="cursor-pointer flex items-center text-gray-700 font-bold text-sm uppercase transition hover:text-emerald-500">
                                        <router-link to="/categories">See More...</router-link>
                                    </div>
                                </div>
                            </template>
                            <template v-else>
                                    <template v-for="(i, index) in 8" :key="index">
                                        <div class="flex mb-3 items-center">
                                            <div class="mr-2 w-10 h-6 rounded-sm animate-pulse bg-gray-200"></div>
                                            <div class="w-full mr-4 h-6 animate-pulse bg-gray-200"></div>
                                            <div class="ml-auto text-sm px-2 py-auto rounded-full w-8 h-6 animate-pulse bg-gray-200"></div>
                                        </div>
                                    </template>

                                    <div class="cursor-pointer flex items-center text-gray-700 font-bold text-sm uppercase transition hover:text-emerald-500">
                                        <router-link to="/categories">See More...</router-link>
                                    </div>
                            </template>
                        </div>
                        <div class="w-full bg-white shadow-sm rounded-sm p-4 mt-6">
                            <div class="text-xl font-bold text-gray-700 mb-3">Tags</div>
                            <template v-if="tags">
                                <div class="flex items-center flex-wrap gap-2">
                                    <div v-for="(tag, index) in tags" :key="index" class="px-3 py-1  text-sm border border-gray-200 rounded-sm transition hover:bg-emerald-500 hover:text-white">
                                        <router-link :to="`/tag/${tag.slug}`">{{tag.name}}</router-link>
                                    </div>
                                </div>
                            </template>
                        </div>
                </div>
            </div>
        </main>
        <Footers />
    </div>
</template>