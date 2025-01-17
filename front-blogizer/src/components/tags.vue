<script setup>
import { onMounted, ref } from 'vue';
import api from "../axios"

const tags = ref([])

onMounted(() =>
    api.get('/api/home/tags').then(res => {
        tags.value = res.data.data
    }))
</script>

<template>
    <div class="w-full bg-white shadow-sm rounded-sm p-4 mt-6">
        <div class="text-xl font-bold text-gray-700 mb-3">Tags</div>
        <template v-if="tags">
            <div class="flex items-center flex-wrap gap-2">
                <div v-for="(tag, index) in tags" :key="index"
                    class="cursor-pointer px-3 py-1.5 text-sm border shadow-sm text-gray-700 border-gray-300 rounded-sm transition hover:bg-emerald-500 hover:text-white">
                    <router-link :to="`/tag/${tag.slug}`">{{ tag.name }}</router-link>
                </div>
            </div>
        </template>
    </div>
</template>