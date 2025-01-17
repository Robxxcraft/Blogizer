<script setup>
import { onMounted, ref } from 'vue';
import api from "../axios"

const categories = ref([])

onMounted(() =>
    api.get('/api/home/categories').then(res => {
        categories.value = res.data.data
    }))
</script>

<template>
    <div class="w-full h-auto bg-white shadow-sm rounded-sm p-4 ">
        <div class="text-xl font-bold text-gray-700 mb-3">Categories</div>
        <template v-if="categories">
            <div class="space-y-3">
                <div v-for="(category, index) in categories" :key="index">
                    <router-link :to="`/categories/${category.slug}`">
                        <div
                            class="flex mb-1 items-center text-gray-800 font-bold text-sm uppercase transition hover:text-emerald-500">
                            <div class="mr-2">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22"
                                    fill="currentColor">
                                    <path fill="none" d="M0 0h24v24H0z" />
                                    <path
                                        d="M4 5v14h16V7h-8.414l-2-2H4zm8.414 0H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2z" />
                                </svg>
                            </div>
                            <div>{{ category.name }}</div>
                            <div
                                class="ml-auto text-sm px-2 py-auto border border-green-200 rounded-full bg-green-100 text-green-800">
                                {{ category.count }}</div>
                        </div>
                    </router-link>
                </div>

                <div
                    class="cursor-pointer flex items-center text-gray-700 font-bold text-sm uppercase transition hover:text-emerald-500">
                    <router-link to="/categories">See More...</router-link>
                </div>
            </div>
        </template>
    </div>
</template>