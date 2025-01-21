

<script setup>
import PostsList from "../components/PostsList.vue"
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import { ref } from '@vue/reactivity';
import api from '../axios';
import { onMounted, watch } from '@vue/runtime-core';
import { useRoute } from 'vue-router';

const tagged = ref('')
const categories = ref([])
const tags = ref([])
const route = useRoute()

watch(route, ()=>{
    tagged.value = route.params.slug
})

onMounted(() => {
    tagged.value = route.params.slug
    api.get('/api/home/tags').then(res => {
        tags.value = res.data.data
    })
    api.get('/api/home/categories').then(res => {
        categories.value = res.data.data
    })
})
</script>

<template>
    <div class="overflow-hidden">
        <Navigation />
        <main class="py-14 md:py-20 bg-gray-100">
            <div class="mx-4 md:mx-10 lg:mx-16 flex flex-wrap lg:flex-nowrap lg:gap-4">
                <div class="w-full">
                    <div class="flex">
                        <div class="truncate text-ellipsis max-w-30 md:max-w-36 rounded-sm bg-white text-emerald-500 border border-emerald-500 hover:text-white hover:bg-emerald-500 cursor-pointer font-bold px-3 py-1.5 text-sm">{{tagged}}</div>
                    </div>
                    <div class="mt-4">
                        <PostsList :url="`tag/${tagged}`">
                            <template v-slot:title>
                                <div>
                                    <div class="font-bold text-base md:text-xl text-gray-700 mb-2 tracking-wide">Searched Posts</div>
                                    <div class="bg-emerald-500 rounded-sm w-32 md:w-40 h-1"></div>
                                </div>
                            </template>
                        </PostsList>
                    </div>
                </div>
                <!-- right sidebar -->
                <div class="right-sidebar w-full">
                    <div class="bg-white shadow-sm rounded-sm p-4">
                            <div class="text-xl font-bold text-gray-700 mb-3">Categories</div>
                            <template v-if="categories">
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