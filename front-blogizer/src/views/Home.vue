<template>
    <Navigation />
        <main class="py-14 md:py-20 bg-gray-100">
            <div class="mx-4 md:mx-10 lg:mx-16 flex flex-wrap lg:flex-nowrap lg:gap-4">
                <!-- Main content -->
                <div class="w-full">
                    <template v-if="banners.length > 0">
                        <swiper class="mw-900" :autoplay="{ delay: 3000, disableOnInteraction: false }" :pagination="true" :slides-per-view="1" :space-between="25">
                            <template v-for="(banner, index) in banners" :key="index">
                                <swiper-slide class="swiper-wh">
                                    <img :src="banner.content" class="rounded shadow-sm w-full h-full" alt="banner1" />
                                </swiper-slide>
                            </template>
                        </swiper>
                    </template>
                    <template v-else>
                        <div class="mw-900">
                            <div class="swiper-wh bg-gray-200 rounded shadow-sm"></div>
                        </div>
                    </template>

                    <div class="mb-8">
                        <PostsList url="recent">
                            <template v-slot:title>
                                <div>
                                    <div class="font-bold text-base md:text-xl text-gray-700 mt-8 mb-2 tracking-wide">Posts</div>
                                    <div class="bg-green-400 rounded-sm w-14 md:w-16 h-1"></div>
                                </div>
                            </template>
                        </PostsList>
                    </div>
                </div>


                <!-- right sidebar -->
                <div class="right-sidebar w-full md:grid md:grid-cols-2 lg:block gap-4">
                    <div class="bg-white shadow-sm rounded-sm p-4 h-475">
                        <div class="text-lg md:text-xl font-bold text-gray-700 mb-3 tracking-wide">Popular Posts</div>
                        <template v-if="!popularSloading">
                            <div class="space-y-3">
                                <div v-for="(popular, index) in popularPost" :key="index">
                                    <router-link :to="`/posts/${popular.slug}/details`">
                                        <div class="flex">
                                            <div class="flex-shrink-0 h-16 w-20 rounded overflow-hidden shadow-sm">
                                                <template v-if="popular.photo">
                                                    <img :src="popular.photo" class="object-cover w-full h-full" alt="postphoto">
                                                </template>
                                                <template v-else>
                                                    <div class="bg-gray-300 w-full h-full flex items-center justify-center py-4">
                                                        <svg class="text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                                                    </div>
                                                </template>
                                            </div>
                                            <div class="flex-grow pl-3">
                                                <div class="flex items-end text-gray-400 text-xs mb-1">
                                                    <svg class="w-4 h-4 mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                                    {{popular.created_at}}
                                                </div>
                                                <div
                                                    class="leading-5 truncate two-lines font-bold text-gray-800 transition-color hover:text-green-500">
                                                    {{popular.title}}
                                                </div>
                                            </div>
                                        </div>
                                    </router-link>
                                </div>

                                <div class="cursor-pointer flex items-center text-gray-700 font-bold text-sm uppercase transition hover:text-green-500 pt-1">
                                    <router-link to="/popular">See More...</router-link>
                                </div>
                            </div>
                        </template>
                        <template v-else>
                            <div class="space-y-3">
                                <div v-for="i in 5" :key="i">
                                        <div class="flex">
                                            <div class="flex-shrink-0">
                                                <div class="bg-gray-200 animate-pulse h-16 w-20 lg:w-14 xl:w-16 rounded"></div>
                                            </div>
                                            <div class="flex-grow pl-3 pt-1">
                                                <div class="bg-gray-200 animate-pulse w-24 h-2 mb-4 pl-1"></div>
                                                <div class="bg-gray-200 animate-pulse w-full h-3 mb-2"></div>
                                                <div class="bg-gray-200 animate-pulse w-full h-3"></div>
                                            </div>
                                        </div>
                                </div>
                                <div class="bg-gray-200 w-16 h-3 animate-pulse"></div>
                            </div>
                        </template>
                    </div>

                    <div class="w-full mt-6 md:mt-0 lg:mt-6 h-auto bg-white shadow-sm rounded-sm p-4 ">
                        <div class="text-xl font-bold text-gray-700 mb-3">Categories</div>
                        <template v-if="categories">
                            <div class="space-y-2">
                                <div v-for="(category, index) in categories" :key="index">
                                <router-link :to="`/categories/${category.slug}`">
                                <div class="flex mb-1 items-center text-gray-800 font-bold text-sm uppercase transition hover:text-green-500">
                                    <div class="mr-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4 5v14h16V7h-8.414l-2-2H4zm8.414 0H21a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h7.414l2 2z"/></svg>
                                    </div>
                                    <div>{{category.name}}</div>
                                    <div class="ml-auto text-sm px-2 py-auto border border-green-200 rounded-full bg-green-100 text-green-800">{{category.count}}</div>
                                </div>
                                </router-link>
                                </div>

                                <div class="cursor-pointer flex items-center text-gray-700 font-bold text-sm uppercase transition hover:text-green-500">
                                    <router-link to="/categories">See More...</router-link>
                                </div>
                            </div>
                        </template>
                    </div>
                    <div class="w-full bg-white shadow-sm rounded-sm p-4 mt-6">
                        <div class="text-xl font-bold text-gray-700 mb-3">Tags</div>
                        <template v-if="tags">
                            <div class="flex items-center flex-wrap gap-2">
                                <div v-for="(tag, index) in tags" :key="index" class="px-3 py-1  text-sm border border-gray-200 rounded-sm transition hover:bg-green-500 hover:text-white">
                                    <router-link :to="`/tag/${tag.slug}`">{{tag.name}}</router-link>
                                </div>
                            </div>
                        </template>
                    </div>
                </div>
            </div>
        </main>
    <Footers />
</template>

<script>
import Navigation from "../components/navigation.vue"
import Footers from  "../components/footer.vue"
import PostsList from "../components/PostsList.vue"
import api from "../axios"
import { Swiper, SwiperSlide } from "swiper/vue"
import SwiperCore, { Pagination, Virtual, Autoplay } from "swiper"
import "swiper/swiper-bundle.css"
import { ref } from '@vue/reactivity'
import { onMounted } from '@vue/runtime-core'
SwiperCore.use([Pagination, Virtual, Autoplay])
export default {
    components: {
        Navigation,
        Footers,
        PostsList,
        Swiper,
        SwiperSlide
    },
    setup() {
        const popularPost = ref([])
        const categories = ref([])
        const tags = ref([])
        const banners = ref([])
        const popularSloading = ref(false)
        
        onMounted(() => {
            api.get('/api/setting/banner').then(res=>{
                banners.value = res.data
            })
            api.get('/api/home/tags').then(res => {
                tags.value = res.data.data
            })
            api.get('/api/home/categories').then(res => {
                categories.value = res.data.data
            })
            popularSloading.value = true
            api.get('/api/home/posts/popular').then(res => {
                popularPost.value = res.data.data
                popularSloading.value = false
            })
        })
        
        return { Pagination, popularPost, categories, tags, banners, popularSloading }
    },
}
</script>

<style>
.bright{
    filter: brightness(25%);
}

.swiper-pagination-bullet-active{
    background-color: #10b981;
}

.swiper-wh {
    height: 200px !important;
    width: 100% !important;
}

@media (min-width: 539px){
    .swiper-wh {
        height: 400px !important;
        width: 100% !important;
    }

    .mw-900 {
        max-width: 100%;
    }
}

@media (min-width: 1200px){
    .swiper-wh {
        height: 475px !important;
        width: 900px !important;
    }

    .mw-900 {
        max-width: 900px;
    }
}
</style>