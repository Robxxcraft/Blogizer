<script setup>
import { computed, ref } from '@vue/runtime-core'
import { useRouter } from 'vue-router'
import { onClickOutside } from '@vueuse/core'
import store from '../store/auth'
import api from '../axios'

// ─── State ───────────────────────────────────────────────────────────────────

const router = useRouter()
const search = ref('')
const logoutPopUp = ref(false)
const logoutEl = ref(null)

const auth = computed(() => store.state.user)

// ─── Navigation ──────────────────────────────────────────────────────────────

const toggleNav = () => {
  document.querySelector('.tabs').classList.toggle('-translate-y-full')
}

const toggleAuthDropdown = () => {
  document.querySelector('#auth-dropdown').classList.toggle('open')
}

// ─── Logout Modal ────────────────────────────────────────────────────────────

const openToast = () => {
  const isNavOpen = !document.querySelector('.-translate-y-full')
  if (isNavOpen) toggleNav()

  ;['nav', 'main', 'footer'].forEach(sel =>
    document.querySelector(sel)?.classList.toggle('bright')
  )
  logoutPopUp.value = !logoutPopUp.value
}

onClickOutside(logoutEl, (e) => {
  if (e.target.id !== 'close-button' && logoutPopUp.value) {
    openToast()
  }
})

const logout = async () => {
  await api.get('/api/logout')
  localStorage.removeItem('token')
  location.href = '/'
}

// ─── Search ──────────────────────────────────────────────────────────────────

const handleSearch = () => {
  if (search.value.trim()) {
    router.push({ name: 'Search', query: { data: search.value } })
  }
}
</script>

<template>
  <nav class="shadow-sm w-full fixed z-30">
    <div class="flex flex-col oh lg:flex-row py-2 items-between justify-center lg:items-center lg:justify-between absolute bg-emerald-500 px-2 md:px-8 lg:px-14 w-full">

      <!-- Brand + Mobile Toggle -->
      <div class="ml-2 flex items-center lg:mt-0 justify-between lg:justify-none text-white">
        <div class="flex items-center py-2 lg:py-0">
          <svg class="mr-2" version="1.0" xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 655 748" preserveAspectRatio="xMidYMid meet">
            <g transform="translate(0,748) scale(0.1,-0.1)" fill="currentColor" stroke="none">
              <path d="M5361 6758 c-253 -381 -671 -1012 -930 -1403 -258 -390 -894 -1351 -1413 -2134 -519 -783 -946 -1429 -950 -1436 -5 -9 90 -77 310 -223 175 -116 323 -212 330 -214 6 -2 176 245 376 547 200 303 466 703 589 890 124 187 413 624 643 970 229 347 481 727 559 845 78 118 261 395 407 615 896 1353 1188 1796 1187 1803 0 5 -399 272 -620 415 l-29 19 -459 -694z"/>
              <path d="M4057 6772 c-8 -9 -48 -69 -89 -132 -41 -63 -362 -547 -713 -1075 -351 -528 -693 -1043 -760 -1145 -67 -102 -395 -597 -730 -1100 -334 -503 -609 -920 -612 -926 -4 -11 793 -547 807 -542 7 3 181 263 1078 1616 704 1061 1070 1611 1449 2182 210 316 384 582 387 590 4 10 -19 32 -77 69 -756 500 -725 480 -740 463z"/>
              <path d="M1317 4360 c-532 -798 -967 -1452 -967 -1455 0 -3 155 -108 345 -235 l345 -230 961 1442 c529 793 964 1449 966 1458 2 10 -95 80 -313 225 -174 116 -329 218 -343 227 l-28 18 -966 -1450z"/>
              <path d="M206 2688 c-7 -37 -99 -2659 -93 -2665 6 -5 119 43 1502 641 528 228 961 419 962 423 1 4 -51 44 -115 87 -64 44 -592 404 -1172 801 -580 396 -1060 724 -1067 728 -8 5 -14 0 -17 -15z"/>
            </g>
          </svg>
          <span class="font-bold text-xl">Blogizer</span>
        </div>

        <button class="lg:hidden mr-2 text-white bg-emerald-400 hover:bg-emerald-300 p-1 rounded-lg" @click="toggleNav">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs">
            <rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/>
            <rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/>
          </svg>
        </button>
      </div>

      <!-- Nav Tabs -->
      <div class="tabs rounded-b px-2 lg:px-0 top-10 left-0 transform lg:transform-none -translate-y-full bg-emerald-500 flex flex-col lg:flex-row justify-between w-full lg:py-1.5">

        <!-- Links -->
        <div class="lg:ml-12 mt-4 mb-8 lg:my-0 flex flex-col lg:flex-row uppercase lg:space-x-2 items-start lg:items-center space-y-3 lg:space-y-0">
          <router-link to="/" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
            <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20 9v11a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V9"/><path d="M9 22V12h6v10M2 10.6L12 2l10 8.6"/>
            </svg>
            <span class="text-xs md:text-sm font-bold tracking-wide">Home</span>
          </router-link>

          <router-link to="/popular" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
            <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/>
            </svg>
            <span class="text-xs md:text-sm font-bold tracking-wide">Popular</span>
          </router-link>

          <router-link to="/recent" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
            <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/>
            </svg>
            <span class="text-xs md:text-sm font-bold tracking-wide">Recent</span>
          </router-link>

          <router-link to="/profile" class="hover:text-emerald-100 flex items-center text-white py-2 px-3 rounded-lg">
            <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
              <path fill="none" d="M0 0h24v24H0z"/>
              <path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/>
            </svg>
            <span class="text-xs md:text-sm font-bold tracking-wide">Profile</span>
          </router-link>
        </div>

        <!-- Search + Auth -->
        <div class="mx-2 lg:relative lg:flex">
          <div class="flex">
            <!-- Search -->
            <div class="cursor-pointer hover:text-emerald-500 mr-8 lg:w-auto flex items-center mb-8 lg:mb-0 bg-gray-50 rounded-3xl text-gray-400 shadow-sm">
              <svg @click="handleSearch" class="mx-2 shrink-0" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs">
                <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
              </svg>
              <input
                v-model="search"
                type="text"
                class="w-full px-2 py-2 bg-transparent focus:outline-none text-sm"
                placeholder="Search"
                @keyup.enter="handleSearch"
              />
            </div>

            <!-- Add Post -->
            <template v-if="auth">
              <router-link to="/posts/add" title="Add post" class="ml-auto">
                <div class="rounded-full flex items-center bg-white text-emerald-500 shadow-sm p-2 hover:text-white hover:bg-emerald-500 transition duration-300">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                    <path fill="none" d="M0 0h24v24H0z"/>
                    <path d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"/>
                  </svg>
                </div>
              </router-link>
            </template>
          </div>

          <!-- Authenticated -->
          <template v-if="auth">
            <div class="select-none">

              <!-- Desktop avatar -->
              <button class="hidden lg:flex ml-2 w-9 h-9 rounded-full overflow-hidden shadow-sm cursor-pointer" @click="toggleAuthDropdown">
                <img v-if="auth.photo" :src="auth.photo" alt="Avatar" class="w-full h-full object-cover" />
                <div v-else class="w-full h-full bg-white flex justify-center items-center">
                  <UserIcon />
                </div>
              </button>

              <!-- Mobile user row -->
              <div class="lg:hidden mt-2 mb-4 flex justify-between items-end">
                <div class="flex items-center">
                  <div class="mr-2 w-9 h-9 border border-gray-300 rounded-full overflow-hidden shadow-sm">
                    <img v-if="auth.photo" :src="auth.photo" alt="Avatar" class="w-full h-full object-cover" />
                    <div v-else class="w-full h-full bg-white flex justify-center items-center">
                      <UserIcon />
                    </div>
                  </div>
                  <span class="text-white font-bold text-sm tracking-wide">{{ auth.username }}</span>
                </div>

                <div class="flex flex-col">
                  <template v-if="auth.role === 'Admin'">
                    <div class="text-gray-700 mb-3 shadow-sm w-24 hover:text-emerald-500 cursor-pointer">
                      <a href="/admin/dashboard" class="bg-white px-2 py-1 rounded-sm text-sm flex font-bold">
                        <AdminIcon />
                        <span class="ml-2">Admin</span>
                      </a>
                    </div>
                  </template>
                  <button class="px-2 py-1 rounded-sm w-24 shadow-sm flex bg-red-500 hover:bg-red-600 text-white cursor-pointer" @click="openToast">
                    <LogoutIcon />
                    <span class="ml-2 text-sm font-bold">Logout</span>
                  </button>
                </div>
              </div>

              <!-- Desktop dropdown -->
              <div id="auth-dropdown" class="hidden absolute min-w-32 lg:top-12 right-0 bg-white shadow-sm border border-gray-300 rounded p-4">
                <div class="flex items-center text-gray-700 border-b-2 pb-4 mb-4">
                  <UserIcon class="w-9 h-9" />
                  <div class="w-full ml-2 font-bold">
                    <div class="truncate w-16 text-sm">{{ auth.username }}</div>
                    <div class="text-xs text-emerald-500">online</div>
                  </div>
                </div>

                <template v-if="auth.role === 'Admin'">
                  <div class="mb-3 text-gray-700 hover:text-gray-800 cursor-pointer">
                    <a href="/admin/dashboard" class="text-sm flex items-end font-bold">
                      <AdminIcon />
                      <span class="ml-2">Admin page</span>
                    </a>
                  </div>
                </template>

                <button class="flex items-end text-red-500 hover:text-red-700 cursor-pointer" @click="openToast">
                  <LogoutIcon />
                  <span class="ml-2 text-sm tracking-wide font-bold">Logout</span>
                </button>
              </div>
            </div>
          </template>

          <!-- Guest -->
          <template v-else>
            <router-link to="/login" class="flex items-center bg-white text-emerald-500 mb-2 lg:mb-0 mr-3 shadow rounded-lg px-2 py-1.5 text-sm hover:text-white hover:bg-emerald-400 border hover:border-white transition font-bold uppercase tracking-wide">
              Login
            </router-link>
            <router-link to="/register" class="flex items-center bg-white text-emerald-500 mb-2 lg:mb-0 shadow rounded-lg px-2 py-1.5 text-sm hover:text-white hover:bg-emerald-400 border hover:border-white transition font-bold uppercase tracking-wide">
              Register
            </router-link>
          </template>
        </div>
      </div>
    </div>
  </nav>

  <!-- Logout Modal -->
  <Teleport to="body">
    <div v-if="logoutPopUp" class="fixed inset-0 z-30 flex justify-center items-center">
      <div ref="logoutEl" class="max-w-xs md:max-w-sm w-full bg-white text-red-500 rounded shadow-md p-5">
        <div class="text-sm md:text-base flex justify-between mb-12">
          <div class="flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs">
              <path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/>
              <line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/>
            </svg>
            <span class="tracking-wide font-bold ml-4">Are you sure you want to logout?</span>
          </div>
          <button id="close-button" class="cursor-pointer hover:text-red-600" @click="openToast">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
              <path fill="none" d="M0 0h24v24H0z"/>
              <path d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z"/>
            </svg>
          </button>
        </div>
        <div class="flex justify-end">
          <button
            @click="logout"
            class="px-4 py-2 border border-red-500 text-sm bg-red-500 text-white hover:bg-red-600 focus:outline-none rounded font-bold uppercase shadow-sm transition"
          >
            Logout
          </button>
        </div>
      </div>
    </div>
  </Teleport>
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
    transition: transform 300ms ease-in-out;
    z-index: -1;
    position: fixed;
  }

  @keyframes fadeX {
    from { transform: translateX(-8px); opacity: 0; }
    to   { transform: translateX(0);    opacity: 1; }
  }

  .open {
    display: block;
    animation: fadeX 0.2s ease-out;
  }
}
</style>