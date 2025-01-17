<template>
    <div class="overflow-hidden">
        <Navigation />
        <main class="py-14 md:py-20 bg-gray-100">
            <div class="mx-4 md:mx-10 lg:mx-16 flex flex-wrap lg:flex-nowrap lg:gap-4">
                <div class="w-full">
                    <div class="inline-block flex mb-2">
                        <div class="truncate text-ellipsis w-30 md:w-36 rounded-full bg-emerald-500 text-white font-bold px-4 py-2 text-sm">{{tagged}}</div>
                    </div>
                    <div class="mb-8">
                        <div class="flex justify-between mb-4">
                            <div>
                                <div class="font-bold text-base md:text-xl text-gray-700 mb-2 tracking-wide">
                                    Tag Posts
                                </div>
                                <div class="bg-emerald-500 rounded-sm w-30 md:w-36 h-1"></div>
                            </div>
                            <div class="relative flex items-end">
                            <div class="flex justify-end items-center">
                            <div class="tracking-wide select-none">
                                <div class="text-emerald-500 text-sm font-bold cursor-pointer hover:bg-emerald-500 hover:text-white px-2 md:px-4 py-0.5 py-1 rounded" @click="monthF">
                                    <span class="inline">{{monthYears.months[currMonth]}}</span> 
                                    <svg class="ml-2 inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                                </div>
                                <div class="month absolute hidden bg-white top-20 right-0 rounded-sm shadow" style="z-index: 5;">
                                    <div class="grid grid-cols-4 w-60">
                                        <div v-for="(month, index ) in monthYears.months" :key="index" class="p-3 cursor-pointer text-sm flex justify-center text-gray-500 hover:text-white hover:bg-emerald-500 font-bold" @click="changeM(index)">{{month}}</div>
                                    </div>
                                </div>
                            </div>
                            <div class="tracking-wide select-none">
                                <div class="text-emerald-500 text-sm font-bold cursor-pointer hover:bg-emerald-500 hover:text-white px-2 md:px-4 py-0.5 py-1 rounded" @click="yearF">
                                    <span class="inline">{{currYear}}</span>
                                    <svg class="ml-2 inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                                </div>
                                <div class="year absolute hidden bg-white top-20 right-0 rounded-sm shadow" style="z-index: 5;">
                                    <div class="grid grid-cols-4 w-60">
                                        <div v-for="(year, index) in monthYears.years" :key="index" class="p-3 text-sm text-gray-500 font-bold hover:bg-emerald-500 hover:text-white cursor-pointer" @click="changeY(year)">{{year}}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </div>
                        </div>
                        <div class="grid md:grid-cols-2 gap-4 mb-8">
                        <template v-if="!sloading">
                            <div v-for="(post, index) in tagPost" :key="index" class="flex bg-white rounded overflow-hidden shadow-sm h-36 xl:h-44">
                                <div class="overflow-hidden basis-half">
                                    <template v-if="post.photo">
                                        <img :src="post.photo" class="object-cover w-full h-full transform hover:scale-110 transition duration-500" alt="postphoto" />
                                    </template>
                                    <template v-else>
                                        <div class="bg-gray-300 h-full rounded flex items-center justify-center">
                                            <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                                        </div>
                                    </template>
                                </div>
                                <div class="flex flex-col justify-between basis-half p-2 space-y-2 tracking-wide">
                                    <div class="text-gray-400 text-xs flex items-end">
                                        <svg class="inline mr-1 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                        <div>{{post.created_at}}</div>
                                    </div>
                                    <div class="flex items-center">
                                        <div class="w-6 h-6 md:w-7 md:h-7 xl:w-10 xl:h-10 mr-3 rounded-full overflow-hidden shadow-sm">
                                                <template v-if="post.userphoto">
                                                    <img :src="post.userphoto" alt="Avatar" class="w-full h-full object-cover" />
                                                </template>
                                                <template v-else>
                                                    <div class="w-full h-full bg-white flex justify-center items-center">
                                                        <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                                    </div>
                                                </template>
                                            </div>
                                        <div class="flex flex-col justify-between font-bold">
                                            <div class="text-xs text-gray-400 hidden xl:block">Creator</div>
                                            <div class="text-sm text-gray-600 w-28 truncate">{{post.username}}</div>
                                        </div>
                                    </div>
                                    <div class="text-gray-800 h-10 truncate text-sm hover:text-emerald-500 font-bold two-lines"><router-link :to="`/posts/${post.slug}/details`">{{post.title}}</router-link></div>
                                    <div class="flex">
                                        <div class="basis-half w-max hidden xl:block ">
                                            <router-link :to="`/posts/${post.slug}/details`">
                                                <div class="inline-block text-white text-xs py-1.5 px-2 rounded-sm uppercase font-bold bg-emerald-500 border border-emerald-500 shadow-sm hover:shadow-md hover:text-emerald-500 hover:bg-transparent transition">
                                                    Read
                                                </div>
                                            </router-link>
                                        </div>
                                        <div class="basis-half lg:text-right text-emerald-500 truncate text-ellipsis text-xs uppercase font-bold md:mt-2">
                                            {{post.category}}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <template v-if="tagPost.length == 0">
                                <div class="col-span-2 flex justify-center text-lg text-gray-400 font-bold">No Posts</div>
                            </template>
                        </template>
                        <template v-else>
                            <div v-for="i in 6" :key="i" class="flex bg-white rounded overflow-hidden shadow-sm h-36 xl:h-44">
                                <div class="overflow-hidden basis-half">
                                    <div class="w-96 h-full animate-pulse bg-gray-200"></div>
                                </div>
                                
                                <div class="basis-half flex flex-col justify-between p-2 space-y-2">
                                    <div class="flex items-end mb-1">
                                        <div class="w-24 h-2 animate-pulse bg-gray-200"></div>
                                    </div>
                                    <div class="flex items-center">
                                        <div class="w-6 h-6 md:w-7 md:h-7 xl:w-10 xl:h-10 mr-3 rounded-full overflow-hidden animate-pulse bg-gray-200 mr-2"></div>
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
                        <template v-if="currLinks">
                            <div class="flex justify-center rounded-sm font-bold tracking-wide text-base md:text-lg bg-gray-50 p-3 shadow-sm text-gray-600 hover:text-emerald-500 border-2 hover:border-emerald-500 hover:shadow-md mb-8 transition cursor-pointer" @click="loadmore()">
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

<script>
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import { computed, ref } from '@vue/reactivity';
import api from '../axios';
import { onMounted, watch } from '@vue/runtime-core';
import { useRoute } from 'vue-router';
export default {
    components: {
        Navigation,
        Footers
    },
    setup() {
        const tagPost = ref([])
        const tagged = ref('')
        const categories = ref([])
        const tags = ref([])
        const loading = ref(false)
        const sloading = ref(false)
        const monthYears = ref({
            months: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Des'],
            years: []
        })
        const currMonth = ref(new Date().getMonth())
        const currYear = ref(new Date().getFullYear())
        const currLinks = ref('')
        const route = useRoute()
        monthYears.value.years = computed(()=>{
            let year = new Date().getFullYear()+1
            let years = []
            for (let index = 0; index <= 10; index++) {
               year -= 1
               years.push(year)
            }
            return years
        })
        const getTags = () => {
            sloading.value = true
            api.get(`/api/posts/tag/${tagged.value}?month=${currMonth.value+1}&year=${currYear.value}`).then(res => {
                tagPost.value = res.data.data
                currLinks.value = res.data.links.next
                sloading.value = false
            })
        }
        const loadmore = () => {
            loading.value = true
            if (currLinks.value) {
                api.get(`${currLinks.value}&month=${currMonth.value+1}&year=${currYear.value}`).then(res => {
                    tagPost.value.push(...res.data.data)
                    currLinks.value = res.data.links.next
                    loading.value = false
                })
            }
        }
        watch(route, ()=>{
            tagged.value = route.params.slug
            getTags()
        })
        onMounted(() => {
            tagged.value = route.params.slug
            api.get('/api/home/tags').then(res => {
                tags.value = res.data.data
            })
            api.get('/api/home/categories').then(res => {
                categories.value = res.data.data
            })
            getTags()
        })

        const monthF = () => {
            const monthEl = document.querySelector('.month')
            const yearEl = document.querySelector('.year')
            yearEl.classList.remove('open')
            monthEl.classList.toggle('open')
        }

        const yearF = () => {
            const monthEl = document.querySelector('.month')
            const yearEl = document.querySelector('.year')
            monthEl.classList.remove('open')
            yearEl.classList.toggle('open')
        }
        
        const changeM = (data) => {
            const monthEl = document.querySelector('.month')
            monthEl.classList.toggle('open')
            currMonth.value = data
            getTags()
        }

        const changeY = (data) => {
            const yearEl = document.querySelector('.year')
            yearEl.classList.toggle('open')
            currYear.value = data
            getTags()
        }

        return { tagged, tagPost, categories, tags, currLinks, loadmore, loading, sloading, monthF, yearF, monthYears, currMonth, currYear, changeM, changeY }
    },
}
</script>