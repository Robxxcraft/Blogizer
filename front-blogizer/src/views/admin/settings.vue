<template>
  <header class="flex items-center px-4 justify-between">
    <div class="py-4 md:px-4 text-lg text-emerald-500 font-bold">Manage</div>
    <div class="py-4 block md:hidden text-emerald-500 hover:text-green-600" id="header" @click="side">
      <svg id="header" style="z-index: 0;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs">
        <rect id="header" x="3" y="3" width="7" height="7"></rect>
        <rect id="header" x="14" y="3" width="7" height="7"></rect>
        <rect id="header" x="14" y="14" width="7" height="7"></rect>
        <rect id="header" x="3" y="14" width="7" height="7"></rect>
      </svg>
    </div>
  </header>
    <section class="p-4 md:p-8 md:mt-0">
      <form @submit.prevent="changeBanner">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-8">
          <div>
            <div class="text-xl text-gray-700 tracking-wide font-bold pl-1 mb-4">Banner 1</div>
            <div class="rounded-t-lg overflow-hidden">
              <template v-if="prevData.banner1">
                <img :src="prevData.banner1" class="w-full h-36 shadow-sm" alt="banner">
              </template>
              <template v-else>
                <div class="bg-gray-300 w-full h-36 rounded flex items-center justify-center">
                  <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                </div>
              </template>
            </div>
            <div class="mx-auto custom-inp overflow-hidden relative cursor-pointer bg-emerald-500 hover:bg-emerald-600 px-2 md:px-4 py-2 text-white text-xs md:text-sm font-bold tracking-wide rounded-b-lg">
              <input class="absolute opacity-0 cursor-pointer" type="file" @change="prevImg1" accept="image/png, image/jpeg, image/jpg">
              <svg class="inline mr-2 w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 5H4v14l9.292-9.294a1 1 0 0 1 1.414 0L20 15.01V5zM2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/></svg>
              Change Photo
            </div>
          </div>
          <div>
            <div class="text-xl text-gray-700 tracking-wide font-bold pl-1 mb-4">Banner 2</div>
            <div class="rounded-t-lg overflow-hidden">
              <template v-if="prevData.banner2">
                <img :src="prevData.banner2" class="w-full h-36 shadow-sm" alt="banner">
              </template>
              <template v-else>
                <div class="bg-gray-300 w-full h-36 rounded flex items-center justify-center">
                  <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                </div>
              </template>
            </div>
            <div class="mx-auto custom-inp overflow-hidden relative cursor-pointer bg-emerald-500 hover:bg-emerald-600 px-2 md:px-4 py-2 text-white text-xs md:text-sm font-bold tracking-wide rounded-b-lg">
              <input class="absolute opacity-0 cursor-pointer" type="file" @change="prevImg2" accept="image/png, image/jpeg, image/jpg">
              <svg class="inline mr-2 w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 5H4v14l9.292-9.294a1 1 0 0 1 1.414 0L20 15.01V5zM2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/></svg>
              Change Photo
            </div>
          </div>
          <div>
            <div class="text-xl text-gray-700 tracking-wide font-bold pl-1 mb-4">Banner 3</div>
            <div class="rounded-t-lg overflow-hidden">
              <template v-if="prevData.banner3">
                <img :src="prevData.banner3" class="w-full h-36 shadow-sm" alt="banner">
              </template>
              <template v-else>
                <div class="bg-gray-300 w-full h-36 rounded flex items-center justify-center">
                  <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                </div>
              </template>
            </div>
            <div class="mx-auto custom-inp overflow-hidden relative cursor-pointer bg-emerald-500 hover:bg-emerald-600 px-2 md:px-4 py-2 text-white text-xs md:text-sm font-bold tracking-wide rounded-b-lg">
              <input class="absolute opacity-0 cursor-pointer" type="file" @change="prevImg3" accept="image/png, image/jpeg, image/jpg">
              <svg class="inline mr-2 w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 5H4v14l9.292-9.294a1 1 0 0 1 1.414 0L20 15.01V5zM2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/></svg>
              Change Photo
            </div>
          </div>
        </div>
        <div class="flex justify-end mt-8">
          <button type="submit" class="focus:outline-none bg-emerald-500 hover:bg-green-600 shadow-sm text-white font-bold text-sm px-4 py-2 uppercase rounded">
            Save
          </button>
        </div>
      </form>
    </section>
</template>

<script>
import { onMounted, reactive, ref } from '@vue/runtime-core'
import api from '../../axios'
export default {
  setup() {
    const side = ()=>{
      document.querySelector("#main").classList.toggle("bright")
      document.querySelector(".sidebar").classList.toggle("-translate-x-full");
    }
    const banners = ref([])
    const loading = ref(false)
    const form = reactive({
      banner1: null,
      banner2: null,
      banner3: null,
    })
    const prevData = reactive({
      banner1: null,
      banner2: null,
      banner3: null,
    })
    onMounted(()=>{
      const isSide = document.querySelector('.-translate-x-full')
      if (!isSide) {
        side()
      }
      api.get('/api/setting/banner').then(res=>{
        prevData.banner1 = res.data[0].content
        prevData.banner2 = res.data[1].content
        prevData.banner3 = res.data[2].content
      })
    })
    const prevImg1 = (event)=> {
      let files = event.target.files[0]
      prevData.banner1 = URL.createObjectURL(files)
      form.banner1 = files
    }
    const prevImg2 = (event)=> {
      let files = event.target.files[0]
      prevData.banner2 = URL.createObjectURL(files)
      form.banner2 = files
    }
    const prevImg3 = (event)=> {
      let files = event.target.files[0]
      prevData.banner3 = URL.createObjectURL(files)
      form.banner3 = files
    }
    const changeBanner = ()=>{
      loading.value = true
      const config = {
      headers: {
        'content-type' : 'multipart/form-data'
        }
      }
      let formData = new FormData()
      formData.append('banner1', form.banner1)
      formData.append('banner2', form.banner2)
      formData.append('banner3', form.banner3)
      api.post('/api/setting/banner', formData, config).then(()=>{
        loading.value = false
      })
    }
    return {side, banners, form, prevData, prevImg1, prevImg2, prevImg3, changeBanner }
  }
}
</script>
<style>
.custom-inp input[type="file"]{
    transform: scale(3);
}
</style>