<template>
  <template v-if="isAdmin">
    <div class="relative min-h-screen md:flex">
    <div v-click-outside="outside" class="sidebar border-r flex flex-col justify-between bg-gray-100 font-bold pl-4 pr-6 max-h-screen fixed inset-y-0 left-0 transform -translate-x-full md:fixed md:translate-x-0 transition duration-300 ease">
      <div class="mt-8">
        <a href="/">
        <div class="text-emerald-500 flex items-center px-6 mb-6 pointer-events-none">
          <svg class="w-8 h-8 mr-2" version="1.0" xmlns="http://www.w3.org/2000/svg" width="28px" height="28px" viewBox="0 0 655.000000 748.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,748.000000) scale(0.100000,-0.100000)" fill="currentColor" stroke="none"> <path d="M5361 6758 c-253 -381 -671 -1012 -930 -1403 -258 -390 -894 -1351 -1413 -2134 -519 -783 -946 -1429 -950 -1436 -5 -9 90 -77 310 -223 175 -116 323 -212 330 -214 6 -2 176 245 376 547 200 303 466 703 589 890 124 187 413 624 643 970 229 347 481 727 559 845 78 118 261 395 407 615 896 1353 1188 1796 1187 1803 0 5 -399 272 -620 415 l-29 19 -459 -694z"/><path d="M4057 6772 c-8 -9 -48 -69 -89 -132 -41 -63 -362 -547 -713 -1075 -351 -528 -693 -1043 -760 -1145 -67 -102 -395 -597 -730 -1100 -334 -503 -609 -920 -612 -926 -4 -11 793 -547 807 -542 7 3 181 263 1078 1616 704 1061 1070 1611 1449 2182 210 316 384 582 387 590 4 10 -19 32 -77 69 -756 500-725 480 -740 463z"/><path d="M1317 4360 c-532 -798 -967 -1452 -967 -1455 0 -3 155 -108 345 -235 l345 -230 961 1442 c529 793 964 1449 966 1458 2 10 -95 80 -313 225 -174 116 -329 218 -343 227 l-28 18 -966 -1450z"/><path d="M206 2688 c-7 -37 -99 -2659 -93 -2665 6 -5 119 43 1502 641 528 228 961 419 962 423 1 4 -51 44 -115 87 -64 44 -592 404 -1172 801 -580 396 -1060 724 -1067 728 -8 5 -14 0 -17 -15z"/></g></svg>
          <div class="text-2xl font-bold">Blogizer</div>
        </div>
        </a>

      <div class="mx-4 text-gray-600 space-y-2">
        <div>
          <router-link to="/admin/dashboard">
            <div class="px-4 py-2 hover:bg-emerald-500 rounded hover:text-white transition duration-200">
              <svg class="inline mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M11 .543c.33-.029.663-.043 1-.043C18.351.5 23.5 5.649 23.5 12c0 .337-.014.67-.043 1h-1.506c-.502 5.053-4.766 9-9.951 9-5.523 0-10-4.477-10-10 0-5.185 3.947-9.449 9-9.95V.542zM11 13V4.062A8.001 8.001 0 0 0 12 20a8.001 8.001 0 0 0 7.938-7H11zm10.448-2A9.503 9.503 0 0 0 13 2.552V11h8.448z"/></svg>
              Dashboard
            </div>
          </router-link>
        </div>
        <div>
          <router-link to="/admin/categories">
            <div class="px-4 py-2 hover:bg-emerald-500 rounded hover:text-white transition duration-200">
              <svg class="inline mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M6 7V4a1 1 0 0 1 1-1h6.414l2 2H21a1 1 0 0 1 1 1v10a1 1 0 0 1-1 1h-3v3a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V8a1 1 0 0 1 1-1h3zm0 2H4v10h12v-2H6V9zm2-4v10h12V7h-5.414l-2-2H8z"/></svg>
              Categories
            </div>
          </router-link>
        </div>
        <div>
          <router-link to="/admin/posts">
            <div class="px-4 py-2 hover:bg-emerald-500 rounded hover:text-white transition duration-200">
              <svg class="inline mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22H4a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h16a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1zm-1-2V4H5v16h14zM7 6h4v4H7V6zm0 6h10v2H7v-2zm0 4h10v2H7v-2zm6-9h4v2h-4V7z"/></svg>
              Posts
            </div>
          </router-link>
        </div>
        <div>
          <router-link to="/admin/users">
            <div class="px-4 py-2 hover:bg-emerald-500 rounded hover:text-white transition duration-200">
              <svg class="inline mr-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              Users
            </div>
          </router-link>
        </div>
        <div>
          <router-link to="/admin/tags">
            <div class="px-4 py-2 hover:bg-emerald-500 rounded hover:text-white transition duration-200">
              <svg class="inline mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M10.9 2.1l9.899 1.415 1.414 9.9-9.192 9.192a1 1 0 0 1-1.414 0l-9.9-9.9a1 1 0 0 1 0-1.414L10.9 2.1zm.707 2.122L3.828 12l8.486 8.485 7.778-7.778-1.06-7.425-7.425-1.06zm2.12 6.364a2 2 0 1 1 2.83-2.829 2 2 0 0 1-2.83 2.829z"/></svg>
              Tags
            </div>
          </router-link>
        </div>
        <div>
          <router-link to="/admin/settings">
            <div class="px-4 py-2 hover:bg-emerald-500 rounded hover:text-white transition duration-200">
              <svg class="inline mr-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M3.34 17a10.018 10.018 0 0 1-.978-2.326 3 3 0 0 0 .002-5.347A9.99 9.99 0 0 1 4.865 4.99a3 3 0 0 0 4.631-2.674 9.99 9.99 0 0 1 5.007.002 3 3 0 0 0 4.632 2.672c.579.59 1.093 1.261 1.525 2.01.433.749.757 1.53.978 2.326a3 3 0 0 0-.002 5.347 9.99 9.99 0 0 1-2.501 4.337 3 3 0 0 0-4.631 2.674 9.99 9.99 0 0 1-5.007-.002 3 3 0 0 0-4.632-2.672A10.018 10.018 0 0 1 3.34 17zm5.66.196a4.993 4.993 0 0 1 2.25 2.77c.499.047 1 .048 1.499.001A4.993 4.993 0 0 1 15 17.197a4.993 4.993 0 0 1 3.525-.565c.29-.408.54-.843.748-1.298A4.993 4.993 0 0 1 18 12c0-1.26.47-2.437 1.273-3.334a8.126 8.126 0 0 0-.75-1.298A4.993 4.993 0 0 1 15 6.804a4.993 4.993 0 0 1-2.25-2.77c-.499-.047-1-.048-1.499-.001A4.993 4.993 0 0 1 9 6.803a4.993 4.993 0 0 1-3.525.565 7.99 7.99 0 0 0-.748 1.298A4.993 4.993 0 0 1 6 12c0 1.26-.47 2.437-1.273 3.334a8.126 8.126 0 0 0 .75 1.298A4.993 4.993 0 0 1 9 17.196zM12 15a3 3 0 1 1 0-6 3 3 0 0 1 0 6zm0-2a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/></svg>
              Settings
            </div>
          </router-link>
        </div>
      </div>
      </div>

       <div>
         <div class="flex items-center justify-center pb-2">
          <div class="mr-2 w-12 h-12 border border-gray-100 bg-gray-200 rounded-full overflow-hidden">
            <template v-if="photo">
                <img :src="photo" alt="Avatar" class="w-full h-full object-cover" />
            </template>
            <template v-else>
                <svg class="w-7 h-7 md:w-8 md:h-8 m-auto mt-4 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
            </template>
          </div>
            <div class="text-gray-700 mw-6 truncate two-lines">
              {{username}}
            </div>
          </div>
        <div class="text-red-500 hover:text-red-600 mb-8 mt-4 flex items-center justify-center cursor-pointer" @click="logout">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M4 18h2v2h12V4H6v2H4V3a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v18a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3zm2-7h7v2H6v3l-5-4 5-4v3z"/></svg>
          <div class="ml-2 font-bold">Logout</div>
        </div>
       </div>
    </div>

    <div id="main" class="md:pl-56 flex-1 min-h-screen bg-gray-100">
      <router-view></router-view>
    </div>
  </div>
  </template>
</template>


<script>
import { computed } from '@vue/reactivity'
import api from '../../axios'
import auth from '../../store/auth'
import { useRouter } from 'vue-router';
export default {
   setup() {
    const isAdmin = computed(async()=>{
      return await auth.state.user?.role == 'Admin'
    })
    const router = useRouter()
    if (!isAdmin.value) {
      router.push('/')
    }

    const outside = (e) => {
      const side = document.querySelector('.-translate-x-full')
      if (e.target.id != 'header' && !side) {
        document.querySelector("#main").classList.toggle("bright")
        document.querySelector(".sidebar").classList.toggle("-translate-x-full");
      }
    }

    const logout = () => {
        api.get('/api/logout').then(()=>{
            localStorage.removeItem('token')
            location.href = "/"
        })
    }
    const photo = computed(()=>{
      return auth.state.user?.photo
    })
    const username = computed(()=>{
      return auth.state.user?.username
    })
    return { isAdmin, outside, logout, photo, username }
  },
};
</script>

<style>
.sidebar {
  z-index: 1;
}
.router-link-exact-active {
  color: #10b891;
}
.mw-6 {
  max-width: 6rem;
}
</style>
