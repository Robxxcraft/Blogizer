<template>
    <div class="flex justify-between">
        <slot name="title"></slot>
        <div class="relative flex items-end">
            <div class="flex justify-end items-center">
                <div class="tracking-wide select-none">
                    <div class="text-green-400 text-sm font-bold cursor-pointer hover:bg-green-500 hover:text-white px-2 md:px-4 py-0.5 py-1 rounded" @click="monthFilter">
                        <span class="inline">{{monthYears.months[currMonth]}}</span> 
                        <svg class="ml-2 inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                    </div>
                    <div class="month absolute hidden bg-white top-12 right-0 rounded-sm shadow" style="z-index: 5;">
                        <div class="grid grid-cols-4 w-60">
                            <div v-for="(month, index ) in monthYears.months" :key="index" class="p-3 cursor-pointer text-sm flex justify-center text-gray-500 hover:text-white hover:bg-green-500 font-bold" @click="changeMonth(index)">{{month}}</div>
                        </div>
                    </div>
                </div>
                <div class="tracking-wide select-none">
                    <div class="text-green-400 text-sm font-bold cursor-pointer hover:bg-green-500 hover:text-white px-2 md:px-4 py-0.5 py-1 rounded" @click="yearFilter">
                        <span class="inline">{{currYear}}</span>
                        <svg class="ml-2 inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                    </div>
                    <div class="year absolute hidden bg-white top-12 right-0 rounded-sm shadow" style="z-index: 5;">
                        <div class="grid grid-cols-4 w-60">
                            <div v-for="(year, index) in monthYears.years" :key="index" class="p-3 text-sm text-gray-500 font-bold hover:bg-green-500 hover:text-white cursor-pointer" @click="changeYear(year)">{{year}}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="grid md:grid-cols-2 gap-4 my-4">
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
                        <img src="../assets/logo.png" class="w-6 h-6 md:w-10 md:h-10 rounded-full mr-3">
                        <div class="flex flex-col justify-between font-bold">
                            <div class="text-xs text-gray-400">Creator</div>
                            <div class="text-sm text-gray-600 w-28 truncate">{{post.username}}</div>
                        </div>
                    </div>
                    <div class="text-gray-800 h-10 truncate text-sm hover:text-green-500 font-bold two-lines"><router-link :to="`/posts/${post.slug}/details`">{{post.title}}</router-link></div>
                    <div class="flex">
                        <div class="basis-half w-max hidden md:block">
                            <router-link :to="`/posts/${post.slug}/details`">
                                <div class="inline-block text-white text-xs py-1.5 px-2 rounded-sm uppercase font-bold bg-green-500 border border-green-500 shadow-sm hover:shadow-md hover:text-green-500 hover:bg-transparent transition">Read</div>
                            </router-link>
                        </div>
                        <div class="basis-half md:text-right text-green-400 truncate text-ellipsis text-xs uppercase font-bold md:mt-2">
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
            <div v-for="i in 6" :key="i" class="flex bg-white rounded overflow-hidden shadow-sm h-36 md:h-40 lg:44">
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
                        <div class="w-12 h-8 animate-pulse bg-gray-200"></div>
                    </div>
                </div>
            </div>
        </template>
    </div>
    <div v-if="nextLink" class="flex justify-center rounded-sm font-bold tracking-wide text-base md:text-lg bg-gray-50 p-3 shadow-sm text-gray-600 hover:text-green-500 border-2 hover:border-green-500 hover:shadow-md mb-8 transition cursor-pointer" @click="loadmore()">
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

<script>
import { ref } from '@vue/reactivity';
import { computed, onMounted } from '@vue/runtime-core';
import api from '../axios';
export default {
  props: ['url'],
  setup(props) {
    const posts = ref([])
    const loading = ref(false)
    const sloading = ref(false)
    const monthYears = ref({
        months: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Des'],
        years: []
    })
    const currMonth = ref(new Date().getMonth());
    const currYear = ref(new Date().getFullYear());
    const nextLink = ref('');

    const getPosts = () => {
        sloading.value = true
        api.get(`/api/lists/posts/${props.url}?month=${currMonth.value+1}&year=${currYear.value}`).then(res => {
            posts.value = res.data.data
            nextLink.value = res.data.links.next
            sloading.value = false
        })
    }

    onMounted(()=>{
        monthYears.value.years = computed(()=>{
            let year = new Date().getFullYear()+1
            let years = []
            for (let index = 0; index <= 10; index++) {
                year -= 1
                years.push(year)
            }
            return years
        })
        getPosts()
    })

    const loadmore = () => {
        loading.value = true
        if (nextLink.value) {
            api.get(`${nextLink.value}&month=${currMonth.value+1}&year=${currYear.value}`).then(res => {
                posts.value.push(...res.data.data)
                nextLink.value = res.data.links.next
                loading.value = false
            })
        }
    }

    const monthFilter = () => {
      document.querySelector(".month").classList.toggle("open")
      document.querySelector(".year").classList.remove("open")
    };

    const yearFilter = () => {
      document.querySelector(".month").classList.remove("open")
      document.querySelector(".year").classList.toggle("open")
    };

    const changeMonth = (data) => {
      document.querySelector(".month").classList.toggle("open")
      currMonth.value = data
      getPosts()
    };

    const changeYear = (data) => {
      document.querySelector(".year").classList.toggle("open")
      currYear.value = data;
      getPosts();
    };

    return { posts, loading, sloading, loadmore, nextLink, monthYears, currMonth, currYear, monthFilter, yearFilter, changeMonth, changeYear }
  },
};
</script>