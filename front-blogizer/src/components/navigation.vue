<script setup>
import { onClickOutside } from '@vueuse/core';
import { computed, ref } from '@vue/runtime-core';
import store from "../store/auth";
import api from '../axios';
import { useRouter } from 'vue-router';

const router = useRouter();
const logoutPopUp = ref(false);
const search = ref('');
const openNav = () => {
    document.querySelector('.tabs').classList.toggle('-translate-y-full')
}
const auth = computed(()=> store.state.user )
const searching = ()=>{
    router.push({name: 'Search', query: {data: search.value}})
};
const openAD = ()=>{
    document.querySelector('.authDrop').classList.toggle('open')
}
const openToast = ()=>{
    const tabs =  document.querySelector('.-translate-y-full')
    if (!tabs) {
        openNav()
    }
    document.querySelector('nav').classList.toggle('bright')
    document.querySelector('main').classList.toggle('bright')
    document.querySelector('footer').classList.toggle('bright')
    logoutPopUp.value = !logoutPopUp.value
}
const logoutEl = ref(null)

onClickOutside(logoutEl, (e) => {
    if (e.target.id != 'close-button') {
        if (logoutPopUp.value) {
            openToast()
        }
    }
})
const logout = () => {
    api.get('/api/logout').then(()=>{
        localStorage.removeItem('token')
        location.href = "/"
    })
}
</script>

<template>
    <nav class="shadow-sm w-full fixed z-30">
        <div class="flex flex-col oh lg:flex-row py-2 items-between justify-center lg:items-center lg:justify-between absolute bg-emerald-500 px-2 md:px-8 lg:px-14 w-full">
            <div class="ml-2 flex items-center lg:mt-0 justify-between lg:justify-none text-white">
                <div class="flex items-center py-2 lg:py-0">
                    <svg class="mr-2" version="1.0" xmlns="http://www.w3.org/2000/svg" width="28px" height="28px" viewBox="0 0 655.000000 748.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,748.000000) scale(0.100000,-0.100000)" fill="currentColor" stroke="none"> <path d="M5361 6758 c-253 -381 -671 -1012 -930 -1403 -258 -390 -894 -1351 -1413 -2134 -519 -783 -946 -1429 -950 -1436 -5 -9 90 -77 310 -223 175 -116 323 -212 330 -214 6 -2 176 245 376 547 200 303 466 703 589 890 124 187 413 624 643 970 229 347 481 727 559 845 78 118 261 395 407 615 896 1353 1188 1796 1187 1803 0 5 -399 272 -620 415 l-29 19 -459 -694z"/><path d="M4057 6772 c-8 -9 -48 -69 -89 -132 -41 -63 -362 -547 -713 -1075 -351 -528 -693 -1043 -760 -1145 -67 -102 -395 -597 -730 -1100 -334 -503 -609 -920 -612 -926 -4 -11 793 -547 807 -542 7 3 181 263 1078 1616 704 1061 1070 1611 1449 2182 210 316 384 582 387 590 4 10 -19 32 -77 69 -756 500-725 480 -740 463z"/><path d="M1317 4360 c-532 -798 -967 -1452 -967 -1455 0 -3 155 -108 345 -235 l345 -230 961 1442 c529 793 964 1449 966 1458 2 10 -95 80 -313 225 -174 116 -329 218 -343 227 l-28 18 -966 -1450z"/><path d="M206 2688 c-7 -37 -99 -2659 -93 -2665 6 -5 119 43 1502 641 528 228 961 419 962 423 1 4 -51 44 -115 87 -64 44 -592 404 -1172 801 -580 396 -1060 724 -1067 728 -8 5 -14 0 -17 -15z"/></g></svg>
                    <div class="font-bold text-xl">Blogizer</div>
                </div>
                <div class="lg:hidden mr-2 text-white hover:text-emerald-100" @click="openNav">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                </div>
            </div>
            <div class="tabs rounded-b px-2 lg:px-0 top-10 left-0 transform lg:transform-none -translate-y-full bg-emerald-500 flex flex-col lg:flex-row justify-between w-full lg:py-1.5">
                <div class="lg:ml-12 mt-4 mb-8 lg:my-0 flex flex-col lg:flex-row uppercase lg:space-x-2 items-start lg:items-center space-y-3 lg:space-y-0">
                    <router-link to="/" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
                        <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 9v11a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V9" /><path d="M9 22V12h6v10M2 10.6L12 2l10 8.6" /></svg>
                        <div class="text-xs md:text-sm font-bold tracking-wide">Home</div>
                    </router-link>
                    <router-link to="/popular" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
                        <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
                        <div class="text-xs md:text-sm font-bold tracking-wide">Popular</div>
                    </router-link>
                    <router-link to="/posts" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
                        <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                        <div class="text-xs md:text-sm font-bold tracking-wide">Recent</div>
                    </router-link>
                    <router-link to="/profile" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
                        <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                        <div class="text-xs md:text-sm font-bold tracking-wide">Profile</div>    
                    </router-link>
                </div>
                <div class="mx-2 lg:relative lg:flex">
                        <div class="flex">
                            <div class="mr-8 lg:w-auto flex items-center flex-row mb-8 lg:mb-0 bg-gray-50 rounded-3xl text-gray-400 shadow-sm">
                                <svg @click="searching" class="mx-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                                <input type="text" v-model="search" class="w-full shadow-sm px-2 py-2 bg-transparent focus:outline-none text-sm" placeholder="Search" @keyup.enter="searching">
                            </div>
                            <template v-if="auth">
                                <div class="ml-auto">
                                    <router-link to="/posts/add" title="Add post">
                                        <div class="rounded-full cursor-pointer flex items-center bg-white text-emerald-500 shadow-sm p-2 text-sm hover:text-white hover:bg-emerald-500 transition duration-300 font-bold uppercase">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"/></svg>
                                        </div>
                                    </router-link>
                                </div>
                            </template>
                        </div>
                        <template v-if="auth">
                            <div class="select-none">
                                <div class="hidden md:block ml-4 lg:ml-2 w-9 h-9 rounded-full overflow-hidden shadow-sm cursor-pointer" @click="openAD">
                                    <template v-if="auth.photo">
                                        <img :src="auth.photo" alt="Avatar" class="w-full h-full object-cover" />
                                    </template>
                                    <template v-else>
                                        <div class="w-full h-full bg-white flex justify-center items-center">
                                            <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                        </div>
                                    </template>
                                </div>
                                <div class="lg:hidden mt-2 mb-4 flex justify-between items-end">
                                    <div class="flex items-center">
                                        <div class="mr-2 w-9 h-9 border border-gray-300 rounded-full overflow-hidden shadow-sm">
                                            <template v-if="auth.photo">
                                                <img :src="auth.photo" alt="Avatar" class="w-full h-full object-cover" />
                                            </template>
                                            <template v-else>
                                                <div class="w-full h-full bg-white flex justify-center items-center">
                                                    <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                                </div>
                                            </template>
                                        </div>
                                        <div class="text-white font-bold text-sm tracking-wide">{{auth.username}}</div>
                                    </div>
                                    <div class="flex flex-col">
                                        <template v-if="auth.role == 'Admin'">
                                            <div class="text-gray-700 mb-3 shadow-sm w-24 hover:text-emerald-500 cursor-pointer">
                                                <a href="/admin/dashboard" class="bg-white hover:bg-eme px-2 py-1 rounded-sm text-sm flex font-bold">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 14v2a6 6 0 0 0-6 6H4a8 8 0 0 1 8-8zm0-1c-3.315 0-6-2.685-6-6s2.685-6 6-6 6 2.685 6 6-2.685 6-6 6zm0-2c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm2.595 7.812a3.51 3.51 0 0 1 0-1.623l-.992-.573 1-1.732.992.573A3.496 3.496 0 0 1 17 14.645V13.5h2v1.145c.532.158 1.012.44 1.405.812l.992-.573 1 1.732-.992.573a3.51 3.51 0 0 1 0 1.622l.992.573-1 1.732-.992-.573a3.496 3.496 0 0 1-1.405.812V22.5h-2v-1.145a3.496 3.496 0 0 1-1.405-.812l-.992.573-1-1.732.992-.572zM18 19.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/></svg>
                                                    <div class="ml-2">Admin</div>
                                                </a>
                                            </div>
                                        </template>
                                        <div class="px-2 py-1 rounded-sm w-24 shadow-sm flex bg-red-500 hover:bg-red-600 text-white cursor-pointer" @click="openToast">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4 18h2v2h12V4H6v2H4V3a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3zm2-7h7v2H6v3l-5-4 5-4v3z"/></svg>
                                            <div class="ml-2 text-sm font-bold">Logout</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="authDrop hidden absolute min-w-32 lg:top-12 right-0 bg-white shadow-sm border border-gray-300 rounded p-4">
                                    <div class="flex items-center text-gray-700 border-b-2 pb-4 mb-4">
                                        <svg class="w-9 h-9" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                        <div class="w-full ml-2 font-bold">
                                            <div class="truncate text-ellipsis w-16 text-sm">{{auth.username}}</div>
                                            <div class="text-xs text-emerald-500">online</div>
                                        </div>
                                    </div>
                                    <template v-if="auth.role == 'Admin'">
                                        <div class="mb-3 text-gray-700 hover:text-gray-800 cursor-pointer">
                                            <a href="/admin/dashboard" class="text-sm flex items-end font-bold">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 14v2a6 6 0 0 0-6 6H4a8 8 0 0 1 8-8zm0-1c-3.315 0-6-2.685-6-6s2.685-6 6-6 6 2.685 6 6-2.685 6-6 6zm0-2c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm2.595 7.812a3.51 3.51 0 0 1 0-1.623l-.992-.573 1-1.732.992.573A3.496 3.496 0 0 1 17 14.645V13.5h2v1.145c.532.158 1.012.44 1.405.812l.992-.573 1 1.732-.992.573a3.51 3.51 0 0 1 0 1.622l.992.573-1 1.732-.992-.573a3.496 3.496 0 0 1-1.405.812V22.5h-2v-1.145a3.496 3.496 0 0 1-1.405-.812l-.992.573-1-1.732.992-.572zM18 19.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/></svg>
                                                <div class="ml-2">Admin page</div>
                                            </a>
                                        </div>
                                    </template>
                                    <div class="flex items-end text-red-500 hover:text-red-700 cursor-pointer" @click="openToast">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4 18h2v2h12V4H6v2H4V3a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3zm2-7h7v2H6v3l-5-4 5-4v3z"/></svg>
                                        <div class="ml-2 text-sm tracking-wide font-bold">Logout</div>
                                    </div>
                                </div>
                            </div>
                        </template>
                        <template v-else>
                            <router-link to="/login" class="flex items-center bg-white text-emerald-500 mb-2 lg:mb-0 mr-3 shadow rounded-lg px-2 py-1.5 text-sm hover:text-white hover:bg-emerald-400 border hover:border-white hover:shadow-white transition font-bold uppercase tracking-wide">
                                Login
                            </router-link>
                            <router-link to="/register" class="flex items-center bg-white text-emerald-500 mb-2 lg:mb-0 shadow rounded-lg px-2 py-1.5 text-sm hover:text-white hover:bg-emerald-400 border hover:border-white hover:shadow-white transition font-bold uppercase tracking-wide">
                                Register
                            </router-link>
                        </template>
                </div>
            </div>
        </div>
    </nav>
    <template v-if="logoutPopUp">
        <div class="fixed h-screen w-screen z-30 flex justify-center items-center">
            <div ref="logoutEl" class="toast max-w-xs md:max-w-sm w-full bg-white text-red-500 rounded shadow-md p-3">
                <div class="text-sm md:text-base flex justify-between mb-12">
                    <div class="flex">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"></path><line x1="12" y1="9" x2="12" y2="13"></line><line x1="12" y1="17" x2="12.01" y2="17"></line></svg>
                        <div class="tracking-wide font-bold ml-4">Are you sure logout ?</div>
                    </div>
                    <div id="close-button" class="cursor-pointer hover:text-red-600" @click="openToast">
                        <svg id="close-button" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z"/></svg>
                    </div>
                </div>
                <div class="text-xs md:text-sm flex justify-end">
                    <button @click="logout" class="px-4 py-2 border border-red-500 text-red-500 bg-white hover:bg-red-500 hover:text-white focus:outline-none rounded font-bold uppercase shadow-sm">logout</button>
                </div>
            </div>
        </div>
    </template>
</template>

<style scoped>
.router-link-exact-active {
    color: #10b981;
    background-color: white;
    box-shadow: 0 1px 6px 0.5px rgba(143, 241, 164, 0.9);
}
.tabs {
    z-index: 0;
}

@media (max-width: 1023px) {
    .oh {
        overflow: hidden;
    }
    .tabs {
        transition-property: transform;
        transition-duration: 300ms;
        transition-timing-function: ease-in-out;
        z-index: -1;
        position: fixed;
    }
    @keyframes fadeX{
        0% {
            transform: translateX(-8px);
            opacity: 0;
        }
    
        100% {
            transform: translateX(0px);
            opacity: 1;
        }
    }
    
    .open {
        display: block;
        animation: fadeX 0.2s ease-out;
    }
}
</style>