<template>
    <Navigation />
    <div class="toast mr-2 translate-x-80 p-2 overflow-hidden z-30 fixed right-0 top-12 transform transition duration-500 bg-white rounded border-l-8 w-60 lg:w-72 shadow-md border-green-400 p-4">
        <div class="flex items-center">
            <svg class="text-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M10 15.172l9.192-9.193 1.415 1.414L10 18l-6.364-6.364 1.414-1.414z"/></svg>
            <div class="ml-4">
                <div id="title" class="text-gray-700 text-sm md:text-base"></div>
                <div id="subtitle" class="text-xs md:text-sm text-gray-800"></div>
            </div>
        </div>
    </div>
    <template v-if="logT">
        <div class="fixed h-screen w-screen flex justify-center items-center z-10">
            <div class="toast max-w-xs md:max-w-sm w-full bg-red-500 rounded shadow-md p-3">
                <div class="text-sm md:text-base flex justify-between mb-12">
                    <div class="flex text-white">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                        <div class="tracking-wide font-bold ml-4">Are you sure delete ?</div>
                    </div>
                    <div class="cursor-pointer" @click="openT(null)">
                        <svg class="text-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z"/></svg>
                    </div>
                </div>
                <div class="text-xs md:text-sm flex justify-end">
                    <button @click="deletePost()" :disabled="loading" class="px-4 py-2 text-red-500 bg-white hover:bg-red-500 hover:text-white focus:outline-none rounded font-bold uppercase shadow-sm">Delete</button>
                </div>
            </div>
        </div>
    </template>
    <main class="py-11 md:py-20 bg-gray-100">
        <div class="md:mx-10 lg:mx-16">
            <div class="w-full flex flex-col gap-8 md:flex-row bg-white p-4 mb-8">
                <div class="basis-half">
                    <div class="text-lg md:text-xl font-bold text-gray-700 mb-3 tracking-wide">Profile</div>
                    <div class="flex items-center tracking-wide">
                        <div class="w-14 h-14 md:w-16 md:h-16 border border-gray-100 bg-gray-200 rounded-full overflow-hidden">
                            <template v-if="user.photo">
                                <img :src="user.photo" alt="Avatar" class="w-full h-full object-cover" />
                            </template>
                            <template v-else>
                                <svg class="w-7 h-7 md:w-8 md:h-8 mx-auto mt-3 md:mt-4 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                            </template>
                        </div>
                        <div class="flex flex-col ml-4">
                            <div class="text-gray-500 font-bold flex">
                                <div class="mr-2 text-lg">{{user.username}}</div>
                                <router-link :to="`/profile/${user.id}/edit`" class="bg-yellow-300 hover:bg-yellow-400 rounded-full p-1.5">
                                    <svg class="w-5 h-5 text-white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M15.728 9.686l-1.414-1.414L5 17.586V19h1.414l9.314-9.314zm1.414-1.414l1.414-1.414-1.414-1.414-1.414 1.414 1.414 1.414zM7.242 21H3v-4.243L16.435 3.322a1 1 0 0 1 1.414 0l2.829 2.829a1 1 0 0 1 0 1.414L7.243 21z"/></svg>
                                </router-link>
                            </div>
                        <div class="text-gray-400 text-sm mb-3">{{user.created_at}}</div></div>
                    </div>
                    <div class="flex">
                        <div class="mt-8 tracking-wide">
                            <div class="text-gray-700 text-xl mb-1 font-bold">Biodata</div>
                            <p class="text-gray-500 text-sm w-full">
                                <template v-if="user.biodata">
                                    {{user.biodata}}
                                </template>
                                <template v-else>
                                    No Biodata
                                </template>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="basis-half">
                    <div class="text-xl text-gray-700 font-bold mb-3">History Dashboard</div>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                        <div class="p-4 rounded bg-green-300 text-white flex items-center justify-between">
                            <div>
                                <div class="font-bold">Posts</div>
                                <template v-if="usrDashboard">
                                    <div class="text-xl mr-1 font-bold">{{usrDashboard.posts}}</div>
                                </template>
                            </div>
                            <svg class="w-8 h-8" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22H4a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h16a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1zm-1-2V4H5v16h14zM7 6h4v4H7V6zm0 6h10v2H7v-2zm0 4h10v2H7v-2zm6-9h4v2h-4V7z"/></svg>
                        </div>
                        <div class="p-4 rounded bg-green-300 text-white flex items-center justify-between">
                            <div>
                                <div class="font-bold">Likes</div>
                                <template v-if="usrDashboard">
                                    <div class="text-xl mr-1 font-bold">{{usrDashboard.likes}}</div>
                                </template>
                            </div>
                            <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M14.6 8H21a2 2 0 0 1 2 2v2.104a2 2 0 0 1-.15.762l-3.095 7.515a1 1 0 0 1-.925.619H2a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1h3.482a1 1 0 0 0 .817-.423L11.752.85a.5.5 0 0 1 .632-.159l1.814.907a2.5 2.5 0 0 1 1.305 2.853L14.6 8zM7 10.588V19h11.16L21 12.104V10h-6.4a2 2 0 0 1-1.938-2.493l.903-3.548a.5.5 0 0 0-.261-.571l-.661-.33-4.71 6.672c-.25.354-.57.644-.933.858zM5 11H3v8h2v-8z"/></svg>
                        </div>
                        <div class="p-4 rounded bg-green-300 text-white flex items-center justify-between">
                            <div>
                                <div class="font-bold">Comments</div>
                                <template v-if="usrDashboard">
                                    <div class="text-xl mr-1 font-bold">{{usrDashboard.comments}}</div>
                                </template>
                            </div>
                            <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M6.455 19L2 22.5V4a1 1 0 0 1 1-1h18a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H6.455zm-.692-2H20V5H4v13.385L5.763 17zM8 10h8v2H8v-2z"/></svg>
                        </div>
                    </div>
                    <div class="bg-green-300 rounded mt-4 p-2">
                        <LineChart :chart-data="lineData" :options="lineOpt" :height="200" />
                    </div>
                </div>
            </div>

            <div class="mb-8">
                <div class="flex flex-wrap lg:flex-nowrap lg:gap-4">
                <div class="w-full mx-4">
                <div class="flex justify-between mb-4">
                    <div>
                        <div class="font-bold text-base md:text-xl text-gray-700 mt-8 mb-2 tracking-wide">Posts</div>
                        <div class="bg-green-400 rounded-sm w-14 md:w-16 h-1"></div>
                    </div>
                    <div class="relative flex items-end">
                        <div class="flex justify-end items-center">
                        <div class="tracking-wide select-none">
                            <div class="text-green-400 text-sm font-bold cursor-pointer hover:bg-green-500 hover:text-white px-2 md:px-4 py-0.5 py-1 rounded" @click="monthF">
                                <span class="inline">{{monthYears.months[currMonth]}}</span> 
                                <svg class="ml-2 inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                            </div>
                            <div class="month absolute hidden bg-white top-20 right-0 rounded-sm shadow" style="z-index: 5;">
                                <div class="grid grid-cols-4 w-60">
                                    <div v-for="(month, index ) in monthYears.months" :key="index" class="p-3 cursor-pointer text-sm flex justify-center text-gray-500 hover:text-white hover:bg-green-500 font-bold" @click="changeM(index)">{{month}}</div>
                                </div>
                            </div>
                        </div>
                        <div class="tracking-wide select-none">
                            <div class="text-green-400 text-sm font-bold cursor-pointer hover:bg-green-500 hover:text-white px-2 md:px-4 py-0.5 py-1 rounded" @click="yearF">
                                <span class="inline">{{currYear}}</span>
                                <svg class="ml-2 inline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                            </div>
                            <div class="year absolute hidden bg-white top-20 right-0 rounded-sm shadow" style="z-index: 5;">
                                <div class="grid grid-cols-4 w-60">
                                    <div v-for="(year, index) in monthYears.years" :key="index" class="p-3 text-sm text-gray-500 font-bold hover:bg-green-500 hover:text-white cursor-pointer" @click="changeY(year)">{{year}}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="grid md:grid-cols-2 gap-4 mb-8">
                        <template v-if="!sloading">
                            <div v-for="(post, index) in userPost" :key="index" class="flex bg-white rounded overflow-hidden shadow-sm h-36 xl:h-44">
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
                                <div class="flex flex-col justify-between basis-half p-2 space-y-1 xl:space-y-2 tracking-wide">
                                    <div class="flex items-start justify-between">
                                        <div class="text-gray-400 text-xs flex items-end">
                                            <svg class="mr-1 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                                            <div class="truncate text-ellipsis w-16">{{post.created_at}}</div>
                                        </div>
                                        <div class="flex items-start">
                                            <router-link :to=" `/posts/${post.slug}/edit`" class="text-blue-500 font-bold focus:outline-none hover:text-blue-600 mr-2"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M15.728 9.686l-1.414-1.414L5 17.586V19h1.414l9.314-9.314zm1.414-1.414l1.414-1.414-1.414-1.414-1.414 1.414 1.414 1.414zM7.242 21H3v-4.243L16.435 3.322a1 1 0 0 1 1.414 0l2.829 2.829a1 1 0 0 1 0 1.414L7.243 21z"/></svg></router-link>
                                            <button @click="openT(post.id)" class="text-red-500 font-bold focus:outline-none hover:text-red-600"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="20" height="20" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17 6h5v2h-2v13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V8H2V6h5V3a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3zm1 2H6v12h12V8zm-9 3h2v6H9v-6zm4 0h2v6h-2v-6zM9 4v2h6V4H9z"/></svg></button>
                                        </div>
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
                                    <div class="text-gray-800 h-10 truncate text-sm hover:text-green-500 font-bold two-lines"><router-link :to="`/posts/${post.slug}/details`">{{post.title}}</router-link></div>
                                    <div class="flex">
                                        <div class="basis-half w-max hidden xl:block ">
                                            <router-link :to="`/posts/${post.slug}/details`">
                                                <div class="inline-block text-white text-xs py-1.5 px-2 rounded-sm uppercase font-bold bg-green-500 border border-green-500 shadow-sm hover:shadow-md hover:text-green-500 hover:bg-transparent transition">
                                                    Read
                                                </div>
                                            </router-link>
                                        </div>
                                        <div class="basis-half lg:text-right text-green-400 truncate text-ellipsis text-xs uppercase font-bold md:mt-2">
                                            {{post.category}}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <template v-if="userPost.length == 0">
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
                        <div class="flex justify-center rounded-sm font-bold tracking-wide text-base md:text-lg bg-gray-50 p-3 shadow-sm text-gray-600 hover:text-green-500 border-2 hover:border-green-500 hover:shadow-md mb-8 transition cursor-pointer" @click="loadmore()">
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
                <div class="right-sidebar w-full mx-4 lg:mx-0">
                    <div class="bg-white shadow-sm rounded-sm p-4">
                        <div class="text-lg md:text-xl font-bold text-gray-700 mb-3 tracking-wide">Popular Posts</div>
                        <template v-if="popularPost.length >= 0">
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
                </div>
                </div>    
            </div>    
        </div>
    </main>

    <Footers />
    
</template>

<script>
import { LineChart } from "vue-chart-3";
import { Chart, LineController, CategoryScale, LinearScale, PointElement, LineElement } from "chart.js";
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import { computed, ref } from '@vue/reactivity';
import { onMounted } from '@vue/runtime-core';
import auth from "../store/auth";
import api from '../axios';
Chart.register(LineController, CategoryScale, LinearScale, PointElement, LineElement)
export default {
    components: {
        Navigation,
        Footers,
        LineChart
    },
    props: ['alert_title', 'alert_subtitle'],
    setup(props) {
        const user = computed(()=>{
            return auth.state.user
        })
        const usrDashboard = ref([])
        const userPost = ref([])
        const popularPost = ref([])
        const loading = ref(false)
        const sloading = ref(false)
        const monthYears = ref({
            months: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Des'],
            years: []
        })
        const currMonth = ref(new Date().getMonth())
        const currYear = ref(new Date().getFullYear())
        const currLinks = ref('')
        monthYears.value.years = computed(()=>{
            let year = new Date().getFullYear()+1
            let years = []
            for (let index = 0; index <= 10; index++) {
               year -= 1
               years.push(year)
            }
            return years
        })
        const pid = ref(null)
        const logT = ref(false)
        const getUserPosts = () => {
            sloading.value = true
            api.get(`/api/lists/posts/user?month=${currMonth.value+1}&year=${currYear.value}`).then(res => {
                userPost.value = res.data.data
                currLinks.value = res.data.links.next
                sloading.value = false
            })
        }
        const loadmore = () => {
            loading.value = true
            if (currLinks.value) {
                api.get(`${currLinks.value}&month=${currMonth.value+1}&year=${currYear.value}`).then(res => {
                    userPost.value.push(...res.data.data)
                    currLinks.value = res.data.links.next
                    loading.value = false
                })
            }
        }
        onMounted(() => {
            auth.mutations.getUser()
            if (props.alert_title) {
                setTimeout(activeToast(props.alert_title, props.alert_subtitle), 500)
            }
            api.get('/api/user/dashboard').then(res => {
                usrDashboard.value = res.data
            })
            api.get('/api/user/posts/popular').then(res => {
                popularPost.value = res.data.data
            })
            
            getUserPosts()
        })

        function openTst() {
            document.querySelector('.toast').classList.toggle('translate-x-80')
        }

        function activeToast(title, subtitle){
            openTst()
            document.querySelector('#title').textContent = title
            document.querySelector('#subtitle').textContent = subtitle
            setTimeout(openTst, 3000)
        }
        const lineData = computed(()=>({
            labels: usrDashboard.value.months,
            datasets: [
            {
                label: 'Posts',
                data: usrDashboard.value.mposts,
                backgroundColor: 'white',
                borderColor: 'white'
            }
            ]
        }))
        const lineOpt = ref({
            responsive: true,
            maintainAspectRatio: false,
            layout: {
                padding: {
                    top: 0
                }
            },
            scales: {
                x: {
                ticks: {
                    color: "white",
                    font: {
                        size: 12
                    }
                },
                grid: {
                    drawBorder: false,
                    display: false
                },
                },
                y: {
                ticks: {
                    color: "white",
                    font: {
                        size: 12
                    },
                    precision: 0 
                },
                grid: {
                    drawBorder: false,
                    display: false
                }
                }
            },
            plugins: {
                legend: {
                display: false
                },
                title: {
                display: false
                },
            }
            })
        const deletePost = ()=>{
            document.querySelector('nav').classList.toggle('bright')
            document.querySelector('main').classList.toggle('bright')
            document.querySelector('footer').classList.toggle('bright')
            logT.value = !logT.value
            const idx = userPost.value.find(i => i.id == pid.value)
            userPost.value.splice(idx, 1)
            activeToast("Success", "Post has been deleted.")
            api.delete(`/api/posts/${pid.value}`)
            pid.value = null
        }

        const monthF = () => {
            document.querySelector('.year').classList.remove('open')
            document.querySelector('.month').classList.toggle('open')
        }

        const yearF = () => {
            document.querySelector('.month').classList.remove('open')
            document.querySelector('.year').classList.toggle('open')
        }
        
        const changeM = (data) => {
            document.querySelector('.month').classList.toggle('open')
            currMonth.value = data
            getUserPosts()
        }

        const changeY = (data) => {
            document.querySelector('.year').classList.toggle('open')
            currYear.value = data
            getUserPosts()
        }

        const openT = (postId)=>{
            pid.value = postId
            document.querySelector('nav').classList.toggle('bright')
            document.querySelector('main').classList.toggle('bright')
            document.querySelector('footer').classList.toggle('bright')
            logT.value = !logT.value
        }

        return { user, usrDashboard, lineData, lineOpt, userPost, deletePost, popularPost, currLinks, loadmore, loading, sloading, monthF, yearF, monthYears, currMonth, currYear, changeM, changeY, logT, openT}
    },
}
</script>