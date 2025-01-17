<script setup>
import { onClickOutside } from '@vueuse/core'
import { reactive, ref } from '@vue/reactivity';
import { onMounted } from '@vue/runtime-core';
import api from '../axios';

const props = defineProps(['url', 'one_grid'])
const posts = ref([])
const loading = ref(false)
const sloading = ref(false)

const nextLink = ref('');

const sortEl = ref(null)
const isSortActive = ref(false)
const sorts = reactive([])

onClickOutside(sortEl, (e) => {
    if (e.target.id != 'filter-button') {
        if (isSortActive.value) {
            isSortActive.value = false
        }
    }
})

const sorting = (sortName)=>{
    if (sorts.length > 0) {
        for (let i = 0; i < sorts.length; i++) {
            if (sorts[i].includes(sortName)) {
                if (sorts[i].includes('asc')) {
                    sorts[i] = sortName+":desc"
                } else if (sorts[i].includes('desc')) {
                    sorts[i] = sortName
                } else {
                    sorts[i] = sortName+":asc"
                }
            }
        }
        if (!sorts.filter((val)=>val.includes(sortName)).length > 0) {
            sorts.push(sortName+":asc")
        }
    } else {
        return sorts.push(sortName+":asc")
    }
    getPosts()
}

const getPosts = () => {
    sloading.value = true
    let querystring = ''
    if (sorts.length > 0) {
        for (let sort of sorts) {
            let splited = sort.split(":")
            if (splited.length == 2) {
                querystring = querystring+splited[0]+'='+splited[1]+'&'
            }
        }
    }
    api.get(`/api/lists/posts/${props.url}?${querystring}`).then(res => {
        posts.value = res.data.data
        nextLink.value = res.data.links.next
        sloading.value = false
    })
}

onMounted(()=>{
    getPosts()
})

const loadmore = () => {
    loading.value = true
    let querystring = ''
    if (sorts.length > 0) {
        for (let sort of sorts) {
            let splited = sort.split(":")
            if (splited.length == 2) {
                querystring = querystring+splited[0]+'='+splited[1]+'&'
            }
        }
    }
    if (nextLink.value) {
        api.get(`${nextLink.value}?${querystring}`).then(res => {
            posts.value.push(...res.data.data)
            nextLink.value = res.data.links.next
            loading.value = false
        })
    }
}

const outside = (e) => {
}
</script>

<template>
    <div class="flex justify-between items-end">
        <slot name="title"></slot>
        <div class="relative flex items-end">
            <div class="flex justify-end items-center">
                <div class="relative">
                    <div id="filter-button" @click="isSortActive = !isSortActive" :class="`cursor-pointer bg-white rounded-lg shadow border-2 ${isSortActive ? 'border-gray-800' : 'border-white'} p-2 text-gray-700`">
                        <svg id="filter-button" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M11.9498 7.94975L10.5356 9.36396L8.00079 6.828L8.00004 20H6.00004L6.00079 6.828L3.46451 9.36396L2.05029 7.94975L7.00004 3L11.9498 7.94975ZM21.9498 16.0503L17 21L12.0503 16.0503L13.4645 14.636L16.0008 17.172L16 4H18L18.0008 17.172L20.5356 14.636L21.9498 16.0503Z"></path></svg>
                    </div>
                    <Transition name="fade">
                        <div ref="sortEl" v-if="isSortActive" class="overflow-hidden absolute bg-white top-12 right-0 w-36 max-w-xl rounded shadow-lg z-10 pt-3">
                            <div class="px-4 bg-white pb-2 text-sm font-bold text-gray-800 w-full max-w-lg">Filter by...</div>
                            <hr>
                            <div @click="sorting('title')" class="px-4 flex items-center justify-between font-semibold text-gray-800 text-sm cursor-pointer hover:bg-emerald-500 hover:text-white pt-1 pb-1.5">
                                <div>Title</div>
                                <div v-if="sorts.includes('title:asc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 8L18 14H6L12 8Z"></path></svg>
                                </div>
                                <div v-else-if="sorts.includes('title:desc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 16L6 10H18L12 16Z"></path></svg>
                                </div>
                            </div>
                            <div @click="sorting('created_at')" class="px-4 flex items-center justify-between font-semibold text-gray-800 text-sm cursor-pointer hover:bg-emerald-500 hover:text-white pt-1 pb-1.5">
                                <div>Created At</div>
                                <div v-if="sorts.includes('created_at:asc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 8L18 14H6L12 8Z"></path></svg>
                                </div>
                                <div v-else-if="sorts.includes('created_at:desc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 16L6 10H18L12 16Z"></path></svg>
                                </div>
                            </div>
                            <div @click="sorting('liked')" class="px-4 flex items-center justify-between font-semibold text-gray-800 text-sm cursor-pointer hover:bg-emerald-500 hover:text-white pt-1 pb-1.5">
                                <div>Liked</div>
                                <div v-if="sorts.includes('liked:asc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 8L18 14H6L12 8Z"></path></svg>
                                </div>
                                <div v-else-if="sorts.includes('liked:desc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 16L6 10H18L12 16Z"></path></svg>
                                </div>
                            </div>
                            <div @click="sorting('commented')" class="px-4 flex items-center justify-between font-semibold text-gray-800 text-sm cursor-pointer hover:bg-emerald-500 hover:text-white pt-1 pb-1.5">
                                <div>Commented</div>
                                <div v-if="sorts.includes('commented:asc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 8L18 14H6L12 8Z"></path></svg>
                                </div>
                                <div v-else-if="sorts.includes('commented:desc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 16L6 10H18L12 16Z"></path></svg>
                                </div>
                            </div>
                        </div>
                    </Transition>
                </div>
            </div>
        </div>
    </div>
    <div :class="`grid ${props.one_grid ? '' : 'md:grid-cols-2'} gap-4 my-4`">
        <template v-if="!sloading">
            <div v-for="(post, index) in posts" :key="index" class="flex bg-white rounded overflow-hidden shadow-sm h-36 md:h-40 lg:44">
                <div class="overflow-hidden basis-half">
                    <img :src="post.photo" class="object-cover h-full transform hover:scale-110 transition duration-500" />
                </div>
                <div class="flex flex-col justify-between basis-half p-2 tracking-wide">
                    <div class="text-gray-400 text-xs flex items-end">
                        <svg class="inline mr-1 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                        <div>{{post.created_at}}</div>
                    </div>
                    <div class="flex items-center">
                        <div class="mr-3 w-9 h-9 rounded-full overflow-hidden shadow-sm cursor-pointer">
                            <img :src="post.userphoto" alt="Avatar" class="w-full h-full object-cover" />
                        </div>
                        <div class="flex flex-col justify-between font-bold">
                            <div class="text-xs text-gray-400">Creator</div>
                            <div class="text-sm text-gray-600 w-28 truncate">{{post.username}}</div>
                        </div>
                    </div>
                    <div class="text-gray-800 h-10 truncate text-sm hover:text-emerald-500 font-bold two-lines"><router-link :to="`/posts/${post.slug}`">{{post.title}}</router-link></div>
                    <div class="flex">
                        <div class="basis-half w-max hidden md:block">
                            <router-link :to="`/posts/${post.slug}/details`">
                                <div class="inline-block text-white text-xs py-1.5 px-2 rounded-sm uppercase font-bold bg-emerald-500 border border-emerald-500 shadow-sm hover:shadow-md hover:text-emerald-500 hover:bg-transparent transition">Read</div>
                            </router-link>
                        </div>
                        <div class="basis-half md:text-right text-emerald-500 truncate text-ellipsis text-xs uppercase font-bold md:mt-2">
                            {{post.category}}
                        </div>
                    </div>
                </div>
            </div>
            <template v-if="posts.length == 0">
                <div class="col-span-2 flex justify-center text-lg text-gray-400 font-bold">No Posts</div>
            </template>
        </template>
        <template v-else>
            <div v-for="i in 6" :key="i" class="flex bg-white rounded overflow-hidden shadow-sm">
                <div class="overflow-hidden w-full">
                    <div class="w-96 h-full animate-pulse bg-gray-200"></div>
                </div>
                <div class="flex flex-col justify-between w-full h-48 p-2 py-2 space-y-2">
                    <div class="flex items-end mb-1">
                        <div class="w-24 h-2 animate-pulse bg-gray-200"></div>
                    </div>
                    <div class="flex items-center">
                        <div class="w-8 h-8 md:w-10 md:h-10 rounded-full animate-pulse bg-gray-200 mr-2"></div>
                        <div class="flex flex-col justify-between">
                            <div class="w-12 h-2 animate-pulse bg-gray-200 mb-2"></div>
                            <div class="w-16 h-2 animate-pulse bg-gray-200"></div>
                        </div>
                    </div>
                    <div class="flex flex-col space-y-2">
                        <div class="w-full h-2 animate-pulse bg-gray-200"></div>
                        <div class="w-full h-2 animate-pulse bg-gray-200"></div>
                    </div>
                    <div>
                        <div class="w-12 h-4 animate-pulse bg-gray-200"></div>
                    </div>
                </div>
            </div>
        </template>
    </div>
    <div v-if="nextLink" class="flex justify-center rounded-sm font-bold tracking-wide text-base md:text-lg bg-gray-50 p-3 shadow-sm text-gray-600 hover:text-emerald-500 border-2 hover:border-emerald-500 hover:shadow-md mb-8 transition cursor-pointer" @click="loadmore()">
        <template v-if="loading">
            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: 0; background: none; display: block; shape-rendering: auto;" width="24" height="24" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                <circle cx="50" cy="50" fill="none" stroke="#52c66e" stroke-width="10" r="35" stroke-dasharray="164.93361431346415 56.97787143782138">
                    <animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" values="0 50 50;360 50 50" keyTimes="0;1"></animateTransform>
                </circle>
            </svg>
        </template>
        <template v-else>
            See More...
        </template>
    </div>
</template>