<script setup>
import { onClickOutside } from '@vueuse/core';
import { reactive, ref, watch } from '@vue/reactivity';
import { onMounted } from '@vue/runtime-core';
import api from '../axios';
import auth from '@/store/auth';

const props = defineProps(['url', 'one_grid', 'disable_loadmore', 'limit'])
const posts = ref([])
const loading = ref(false)
const sloading = ref(false)

const nextLink = ref('');

const sortLists = ref(['title', 'created_at', 'liked', 'commented'])
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
    api.get(`/api/lists/posts/${props.url}${props.url.includes('?') ? '' : '?' }${props.limit ? 'limit='+props.limit+'&' : ''}${querystring}`).then(res => {
        posts.value = res.data.data
        nextLink.value = res.data.links.next
        sloading.value = false
    })
}
watch(() => props.url, () => {
  getPosts()
})

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
        api.get(`${nextLink.value}&${querystring}`).then(res => {
            posts.value.push(...res.data.data)
            nextLink.value = res.data.links.next
            loading.value = false
        })
    }
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
                            <div v-for="(sl) in sortLists" @click="sorting(sl)" class="px-4 flex items-center justify-between font-semibold text-gray-800 text-sm cursor-pointer hover:bg-emerald-500 hover:text-white pt-1 pb-1.5">
                                <div class="capitalize">{{sl.replace('_', ' ')}}</div>
                                <div v-if="sorts.includes(sl+':asc')">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="currentColor"><path d="M12 8L18 14H6L12 8Z"></path></svg>
                                </div>
                                <div v-else-if="sorts.includes(sl+':desc')">
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
                <div class="overflow-hidden basis-5/12 relative">
                    <div v-if="auth.state.user.username == post.username" class="absolute flex items-start z-10 right-0 mr-1 mt-1">
                        <router-link :to=" `/posts/${post.slug}/edit`" class="shadow shadow-blue-500  rounded-full bg-white p-1 border border-blue-500 text-blue-500 font-bold focus:outline-none hover:text-white hover:bg-blue-500 mr-2"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M15.728 9.686l-1.414-1.414L5 17.586V19h1.414l9.314-9.314zm1.414-1.414l1.414-1.414-1.414-1.414-1.414 1.414 1.414 1.414zM7.242 21H3v-4.243L16.435 3.322a1 1 0 0 1 1.414 0l2.829 2.829a1 1 0 0 1 0 1.414L7.243 21z"/></svg></router-link>
                        <button @click="openT(post.id)" class="shadow shadow-red-500 rounded-full bg-white p-1 border border-red-500 text-red-500 font-bold focus:outline-none hover:text-white hover:bg-red-500"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17 6h5v2h-2v13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V8H2V6h5V3a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3zm1 2H6v12h12V8zm-9 3h2v6H9v-6zm4 0h2v6h-2v-6zM9 4v2h6V4H9z"/></svg></button>
                    </div>
                    <img :src="post.photo" class="object-cover w-full h-full transform hover:scale-110 transition duration-500" />
                </div>
                <div class="flex flex-col justify-between basis-7/12 p-3 tracking-wide">
                    <div class="text-gray-400 text-xs flex items-end">
                        <svg class="inline mr-1 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                        <div>{{post.created_at}}</div>
                    </div>
                    <div class="flex items-center">
                        
                        <template v-if="post.userphoto">
                            <div class="mr-3 w-9 h-9 rounded-full overflow-hidden shadow-sm cursor-pointer">
                                <img :src="post.userphoto" alt="Avatar" class="w-full h-full object-cover" />
                            </div>
                        </template>
                        <template v-else>
                            <div class="border rounded-full p-2 mr-3 bg-white flex justify-center items-center">
                                <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                            </div>
                        </template>
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
                <div class="basis-5/12 overflow-hidden w-full">
                    <div class="w-96 h-full animate-pulse bg-gray-200"></div>
                </div>
                <div class="basis-7/12 flex flex-col justify-between w-full h-48 p-3 space-y-2">
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
    <div v-if="nextLink && !props.disable_loadmore" class="flex justify-center rounded-sm font-bold tracking-wide text-base md:text-lg bg-gray-50 p-3 shadow-sm text-gray-600 hover:text-emerald-500 border-2 hover:border-emerald-500 hover:shadow-md mb-8 transition cursor-pointer" @click="loadmore()">
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