<template>
  <header class="flex items-center px-4 justify-between">
    <div class="py-4 md:px-4 text-lg text-green-500 font-bold">Edit</div>
    <div class="py-4 block md:hidden text-green-500 hover:text-green-600" id="header" @click="side">
      <svg id="header" style="z-index: 0;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs">
        <rect id="header" x="3" y="3" width="7" height="7"></rect>
        <rect id="header" x="14" y="3" width="7" height="7"></rect>
        <rect id="header" x="14" y="14" width="7" height="7"></rect>
        <rect id="header" x="3" y="14" width="7" height="7"></rect>
      </svg>
    </div>
  </header>
  <section class="p-4 md:p-8 md:mt-0">
      <router-link to="/admin/categories">
        <div class="flex items-center">
          <div class="bg-green-500 hover:bg-green-600 text-white rounded-sm px-1 shadow-sm hover:shadow-md cursor-pointer" @click="back">
            <svg class="w-7 h-7 md:w-8 md:h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M11.828 12l2.829 2.828-1.414 1.415L9 12l4.243-4.243 1.414 1.415L11.828 12z"/></svg>
          </div>
          <div class="ml-2 font-bold tracking-wide text-green-500">Back</div>
        </div>
      </router-link>
      <div class="text-xl text-gray-700 font-bold mt-4 mb-2">Edit Category</div>
      <form class="w-full mx-auto md:px-8 py-4" @submit.prevent="updateCategory">
          <div class="flex max-w-lg mx-auto flex-wrap px-0 md:px-8  flex-col">
              <div class="flex-2 text-left mb-3">
                <label class="tracking-wide text-gray-700 ml-2">
                    Name
                </label>
                <input class="focus:outline-none mt-2 transition w-full bg-gray-50 text-gray-700 border-2 border-gray-300 rounded py-3 px-4 mb-3 focus:border-green-500" v-model="form.name" type="text">
                <div v-if="errors.name" class="text-left p-1 text-red-500 text-sm italic">{{errors.name[0]}}</div>
              </div>
              <div class="flex-1 text-right">
                <button class="text-white tracking-wide bg-green-500 py-2 px-3 rounded text-sm font-bold shadow-sm transition focus:outline-none hover:bg-green-600 hover:shadow-lg" type="submit">Update</button>
              </div>
          </div>
      </form>
  </section>
</template>


<script>
import { reactive, ref } from '@vue/reactivity';
import { useRoute, useRouter } from 'vue-router';
import api from '../../../axios';
import { onMounted } from '@vue/runtime-core';
export default {
  setup() {
    const router = useRouter();
    const form = reactive({
      'name': null
    });
    const route = useRoute()
    onMounted(()=>{
      api.get(`/api/categories/${route.params.id}`).then(res =>{
        form.name = res.data.name
      })
    })

    const errors = ref({});

    const updateCategory = () => {
      api.post(`/api/categories/${route.params.id}`, form).then(()=>{
        router.push({name: 'ManageCategory', params: {alert_title: 'Success', alert_subtitle: 'Category has been updated.'}})
      }).catch(err => {
        errors.value = err.response.data.errors
      })
    }
    
    const side = ()=>{
      document.querySelector("#main").classList.toggle("bright")
      document.querySelector(".sidebar").classList.toggle("-translate-x-full");
    }

    return { side, updateCategory, errors, form }
  }
};
</script>

<style>
.row {
  background-color: whitesmoke;
}
.row:nth-child(odd){
 background-color: lavender;  
}
</style>