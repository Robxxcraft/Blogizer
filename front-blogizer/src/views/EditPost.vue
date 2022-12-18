<template>
      <Navigation />
      <main class="pt-10 pb-10 lg:pt-20 lg:pb-20 bg-gray-100">
        <div class="mr-2 fixed z-10 right-0 top-16 p-2 overflow-hidden">
          <div class="toast transform transition duration-500 bg-red-500 translate-x-80 rounded md:w-60 lg:w-72 shadow-md p-3">
            <div class="items-center text-white font-bold px-3">
                <div class="text-sm md:text-base mb-2">
                  <div class="uppercase tracking-wide">Errors</div>
                </div>
                <div class="text-xs md:text-sm">
                  <ul class="tracking-wide">
                    <li v-for="(error, index) in Object.values(errors)" :key="index" class="mb-1">{{error[0]}}</li>
                  </ul>
                </div>
            </div>
          </div>
        </div>
      <form class="form max-w-4xl py-4 mx-auto bg-white shadow-sm" @submit.prevent="updatePost">
      <!-- Progress bar -->
      <div class="flex justify-center font-bold text-gray-700 text-lg">Edit Post</div>
      <div class="md:max-w-lg mx-6 md:mx-auto my-7">
        <div class="progressbar">
        <div class="progress" id="progress"></div>
        <div class="progress-step progress-step-active" data-title="Setup"></div>
        <div class="progress-step" data-title="Post Content"></div>
        <div class="progress-step" data-title="Tags"></div>
        <div class="progress-step" data-title="Preview"></div>
      </div>
      </div>

      <div class="form-step mx-auto max-w-3xl form-step-active p-3 tracking-wide">
        <div class="text-lg mb-4 text-green-500 font-bold">
              <svg class="inline w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M5.33 3.271a3.5 3.5 0 0 1 4.254 4.963l10.709 10.71-1.414 1.414-10.71-10.71a3.502 3.502 0 0 1-4.962-4.255L5.444 7.63a1.5 1.5 0 1 0 2.121-2.121L5.329 3.27zm10.367 1.884l3.182-1.768 1.414 1.414-1.768 3.182-1.768.354-2.12 2.121-1.415-1.414 2.121-2.121.354-1.768zm-6.718 8.132l1.414 1.414-5.303 5.303a1 1 0 0 1-1.492-1.327l.078-.087 5.303-5.303z"/></svg>
              Setup
          </div>
          <div class="flex flex-col lg:flex-row justify-between gap-8">
              <div class="basis-half">
                <div class="mb-8">
                  <div class="text-sm md:text-base text-gray-500 mb-2 ml-2 font-bold">Post Title</div>
                  <input type="text" v-model="form.title" placeholder="Enter your post title..." class="text-gray-800 bg-gray-100 px-3 py-2 shadow-sm transition duration-300 ease focus:outline-none border-2 focus:border-green-400 rounded-sm w-full">
                  <div v-if="errors.title" class="p-1 absolute text-red-500 hover:text-red-600 text-sm italic">{{errors.title[0]}}</div>
                </div>
            <div>
              <div class="text-sm md:text-base text-gray-500 mb-2 ml-2 font-bold">Post Category</div>
              <div class="relative select-none">
                <div @click="openCategoryDrop" class="bg-gray-100 flex justify-between items-center pl-4 rounded w-full border-2 hover:border-green-400 text-gray-400 shadow-sm cursor-pointer">
                  <div id="category">Choose Category</div>
                  <svg class="w-10 h-10" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 15l-4.243-4.243 1.415-1.414L12 12.172l2.828-2.829 1.415 1.414z"/></svg>
                </div>
                <div id="categoryDropdown" class="absolute top-12 bg-gray-200 w-full h-36 shadow-sm rounded-sm hidden overflow-y-scroll">
                  <div v-for="(category, index) in categories" :key="index" @click="chooseCategory(category)" class="px-4 py-1 text-gray-500 hover:bg-green-400 hover:text-white text-sm mb-0.5 cursor-pointer">{{category.name}}</div>
                </div>
              </div>
            </div>
              </div>
              <div class="basis-half mb-4">
                <div class="text-sm md:text-base text-gray-500 mb-2 ml-2 font-bold">Post Image</div>
                <div class="mx-auto w-64 h-40 object-fill rounded-lg overflow-hidden">
                    <template v-if="prevData.image">
                      <img :src="prevData.image" class="w-full h-full">
                    </template>
                    <template v-else>
                      <div class="bg-gray-300 h-full rounded flex items-center justify-center">
                        <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                      </div>
                    </template>
                </div>
                <div class="mx-auto w-64 custom-inp cursor-pointer relative overflow-hidden bg-green-400 hover:bg-green-500 mt-3 mb-2 px-2 md:px-4 py-1 text-white text-xs md:text-sm uppercase font-bold tracking-wide rounded-sm">
                    <input class="absolute opacity-0 cursor-pointer" type="file" @change="prevImg" accept="image/png, image/jpeg, image/jpg">
                    <svg class="inline mr-2 w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 5H4v14l9.292-9.294a1 1 0 0 1 1.414 0L20 15.01V5zM2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/></svg>
                    Change Photo
                </div>
              </div>
        </div>
        <div class="flex justify-end mt-2">
          <div class="bg-green-500 py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md hover:bg-green-600 cursor-pointer" @click="changeForm(1)">Next</div>
        </div>
      </div>
      <div class="form-step mx-auto max-w-3xl p-3">
        <div class="text-lg mb-4 text-green-500 font-bold"><svg class="inline mr-1 w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M6.94 14.036c-.233.624-.43 1.2-.606 1.783.96-.697 2.101-1.139 3.418-1.304 2.513-.314 4.746-1.973 5.876-4.058l-1.456-1.455 1.413-1.415 1-1.001c.43-.43.915-1.224 1.428-2.368-5.593.867-9.018 4.292-11.074 9.818zM17 9.001L18 10c-1 3-4 6-8 6.5-2.669.334-4.336 2.167-5.002 5.5H3C4 16 6 2 21 2c-1 2.997-1.998 4.996-2.997 5.997L17 9.001z"/></svg>Post Content</div>
        <div class="bg-green-100 rounded p-2 shadow-sm">
          <template v-if="form.content">
            <Tiptap v-model:content="form.content" />
          </template>
        </div>
        <div class="flex justify-between mt-8">
          <div class="bg-green-500 tracking-wide py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md hover:bg-green-600 cursor-pointer" @click="changeForm(0)">Previous</div>
          <div class="bg-green-500 tracking-wide py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md hover:bg-green-600 cursor-pointer" @click="changeForm(2)">Next</div>
        </div>
      </div>
      <div class="form-step mx-auto max-w-3xl p-3">
        <div class="relative">
          <div class="text-lg md:text-xl text-green-500 font-bold"><svg class="inline mr-2 w-5 h-5 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M10.9 2.1l9.899 1.415 1.414 9.9-9.192 9.192a1 1 0 0 1-1.414 0l-9.9-9.9a1 1 0 0 1 0-1.414L10.9 2.1zm.707 2.122L3.828 12l8.486 8.485 7.778-7.778-1.06-7.425-7.425-1.06zm2.12 6.364a2 2 0 1 1 2.83-2.829 2 2 0 0 1-2.83 2.829z"/></svg>Tags</div>
          <template v-if="form.tags.length < 5">
            <div class="absolute flex flex-row mt-4 top-8 w-full">
              <input type="text" v-model="prevData.formtag" placeholder="Add your post tag..." class="tracking-wide text-sm bg-gray-100 p-2 text-gray-400 focus:outline-none rounded-l-sm border-2 focus:border-green-400 w-full" />
              <div class="bg-green-500 hover:bg-green-600 cursor-pointer text-white py-3 px-4 rounded-r-sm" @click.prevent="addTag">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"/></svg>
              </div>
            </div>
          </template>
            <div class="absolute top-32 flex items-center gap-2 flex-wrap">
              
            <div v-for="(tag, index) in form.tags" :key="index" class="bg-green-400 shadow py-2 px-4 rounded-sm text-xs shadow-md text-white">
              <div class="pr-8 inline">{{tag}}</div>
              <div class="font-bold inline cursor-pointer" @click.prevent="deleteTag(index)">X</div>
            </div>
          </div>
        </div>
        <div class="flex justify-between mt-72">
          <div class="bg-green-500 tracking-wide py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md hover:bg-green-600 cursor-pointer" @click="changeForm(1)">Previous</div>
          <div class="bg-green-500 tracking-wide py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md hover:bg-green-600 cursor-pointer" @click="changeForm(3)">Next</div>
        </div>
      </div>
      <div class="form-step mx-auto max-w-3xl p-3">
          <div class="mb-5 text-lg md:text-xl text-green-500 font-bold"><svg class="inline mr-2 w-6 h-6 md:w-7 md:h-7" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 3c5.392 0 9.878 3.88 10.819 9-.94 5.12-5.427 9-10.819 9-5.392 0-9.878-3.88-10.819-9C2.121 6.88 6.608 3 12 3zm0 16a9.005 9.005 0 0 0 8.777-7 9.005 9.005 0 0 0-17.554 0A9.005 9.005 0 0 0 12 19zm0-2.5a4.5 4.5 0 1 1 0-9 4.5 4.5 0 0 1 0 9zm0-2a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/></svg>Preview</div>
            <div class="flex items-center justify-between mb-6">
              <div class="font-bold text-sm bg-green-500 text-white rounded-sm px-1 shadow-sm">
                  <svg class="w-7 h-7 md:w-8 md:h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M11.828 12l2.829 2.828-1.414 1.415L9 12l4.243-4.243 1.414 1.415L11.828 12z"/></svg>
              </div>
              <div class="font-bold text-sm bg-green-500 text-white px-4 py-1 rounded-sm shadow-sm">
                  Date
              </div>
            </div>
              <div class="text-lg font-bold text-gray-700 mb-4 text-left truncate three-lines">{{form.title ? form.title : '(No Title)'}}.</div>
              <div class="mx-auto mb-6 object-fill rounded-md overflow-hidden photo">
                <template v-if="prevData.image">
                  <img :src="prevData.image" class="w-full h-full">
                </template>
                <template v-else>
                  <div class="bg-gray-300 h-full flex items-center justify-center">
                    <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                  </div>
                </template>
              </div>
              <div class="flex justify-between items-center">
                  <div class="flex items-center">
                      <div class="mr-2 w-10 h-10 md:w-12 md:h-12 border border-gray-300 rounded-full overflow-hidden shadow-sm">
                        <div class="w-full h-full bg-white flex justify-center items-center">
                          <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                        </div>
                      </div>
                      <div class="flex flex-col">
                          <div class="font-bold text-gray-800 text-sm">By</div>
                          <div class="text-gray-700">{{prevData.username}}</div>
                      </div>
                  </div>
                  <div class="font-bold text-gray-600 mr-2 uppercase text-sm">{{prevData.category ? prevData.category : '(No Category)'}}</div>
              </div>
              <div class="mt-6 mx-auto">
                <div class="content" v-html="form.content"></div>
              </div>
              
              <template v-if="form.tags == !null">
                <div class="mx-auto">
                  <div class="text-sm font-bold text-gray-700 mt-6 mb-3">Tags</div>
                  <div class="flex items-center flex-wrap gap-2">
                    <div v-for="(tag, index) in form.tags" :key="index" class="px-3 py-1 text-sm border border-gray-200 rounded-sm transition hover:bg-green-500 hover:text-white">{{tag}}</div>
                  </div>
                </div>
              </template>
              <div class="flex items-center text-gray-700 mt-12 mb-6 gap-6">
                  <div class="flex items-center">
                      <div class="focus:outline-none">
                        <svg class="text-green-500 w-5 h-5 md:w-6 md:h-6 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M14.6 8H21a2 2 0 0 1 2 2v2.104a2 2 0 0 1-.15.762l-3.095 7.515a1 1 0 0 1-.925.619H2a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1h3.482a1 1 0 0 0 .817-.423L11.752.85a.5.5 0 0 1 .632-.159l1.814.907a2.5 2.5 0 0 1 1.305 2.853L14.6 8zM7 10.588V19h11.16L21 12.104V10h-6.4a2 2 0 0 1-1.938-2.493l.903-3.548a.5.5 0 0 0-.261-.571l-.661-.33-4.71 6.672c-.25.354-.57.644-.933.858zM5 11H3v8h2v-8z"/></svg>
                      </div>
                    <div class="font-bold">0</div>
                  </div>
                  <div class="flex items-center">
                    <svg class="w-5 h-5 md:w-6 md:h-6 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M6.455 19L2 22.5V4a1 1 0 0 1 1-1h18a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H6.455zm-.692-2H20V5H4v13.385L5.763 17zM8 10h8v2H8v-2z"/></svg>
                      <div class="font-bold">0</div>
                  </div>
                </div>
                <div class="text-lg text-gray-700 font-bold mb-4">
                  Comments
                </div>
        <div class="flex justify-between mt-8">
          <div class="bg-green-500 py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md cursor-pointer" @click="changeForm(2)">Previous</div>
          <button type="submit" :disabled="loading" class="focus:outline-none bg-green-500 py-2 px-6 rounded text-white text-center font-bold shadow-sm hover:shadow-md">
            <template v-if="loading">
              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: 0; display: block; shape-rendering: auto;" width="24" height="24" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                <circle cx="50" cy="50" fill="none" stroke="#ffffff" stroke-width="10" r="35" stroke-dasharray="164.93361431346415 56.97787143782138">
                <animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" values="0 50 50;360 50 50" keyTimes="0;1"></animateTransform>
              </circle></svg>
            </template>
            <template v-else>
              Update
            </template>
          </button>
        </div>
      </div>
      </form>
      </main>
      <Footers />
</template>

<script>
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import { reactive, ref } from '@vue/reactivity';
import Tiptap from "../components/tiptap.vue";
import api from '../axios';
import store from "../store/auth";
import { onMounted } from '@vue/runtime-core';
import { useRoute, useRouter } from 'vue-router';
export default {
  components: {
    Navigation,
    Footers,
    Tiptap
  },
  setup() {
    const categories = ref([])
    const loading = ref(false)
    const errors = ref({})
    const route = useRoute()
    const router = useRouter()
    const prevData = reactive({
      username: '',
      formtag: '',
      category: null,
      image: null
    })
    const form = reactive({
      id: null,
      title: "",
      photo: null,
      category: null,
      content: '',
      tags: [],
      formtag: ''
    })
    
    onMounted(()=>{
      prevData.username = store.state.user.username
      api.get('/api/lists/categories').then(res=>{
        categories.value = res.data
      })
      api.get(`/api/posts/${route.params.slug}/edit`).then(res=>{
          const data = res.data.data
          if (data.user_id == store.state.user.id) {
              form.id = data.id
              form.title = data.title
              form.category = data.category_id
              document.querySelector('#category').textContent = data.category;
              prevData.category = data.category
              prevData.image = data.photo
              let arr = []
              for (let i = 0; i < data.tags.length; i++) {
                arr.push(data.tags[i].name);
              }
              form.tags = arr
              form.content = data.content
          } 
      })
    })

    const prevImg = (event)=> {
      let files = event.target.files[0]
      prevData.image = URL.createObjectURL(files)
      form.photo = files
    }
    const changeForm = formStepsNum => {
      const progress = document.getElementById("progress");
      const formSteps = document.querySelectorAll(".form-step");
      const progressSteps = document.querySelectorAll(".progress-step");
      formSteps.forEach((formStep) => {
        formStep.classList.contains("form-step-active") &&
        formStep.classList.remove("form-step-active");
      });
      formSteps[formStepsNum].classList.add("form-step-active");
      progressSteps.forEach((progressStep, idx) => {
          if (idx < formStepsNum + 1) {
          progressStep.classList.add("progress-step-active");
          } else {
          progressStep.classList.remove("progress-step-active");
          }
      });
      window.scrollTo(0,0);
      const progressActive = document.querySelectorAll(".progress-step-active");
      progress.style.width = ((progressActive.length - 1) / (progressSteps.length - 1)) * 100 + "%";
    }
    const openCategoryDrop = () => {
      document.querySelector('#category').classList.toggle('border-green-400')
      document.querySelector('#categoryDropdown').classList.toggle('openDrop')
    }
    const chooseCategory = (data) => {
      openCategoryDrop()
      document.querySelector('#category').textContent = data.name;
      form.category = data.id;
      prevData.category = data.name
    }

    const addTag = () => {
      if (form.tags.indexOf(prevData.formtag) === -1) {
        form.tags.push(prevData.formtag)
        prevData.formtag = ''
      } else {
        prevData.formtag = ''
      }
    }

    const deleteTag = (id) => {
      form.tags.splice(id, 1)
    }

    function activeToast(){
      document.querySelector('.toast').classList.toggle('translate-x-80')
    }

    const updatePost = ()=> {
      loading.value = true
      const config = {
      headers: {
        'content-type' : 'multipart/form-data'
        }
      }
      let formData = new FormData()
      formData.append('title', form.title)
      formData.append('photo', form.photo)
      formData.append('category', form.category)
      formData.append('content', form.content)
      formData.append('tags', JSON.stringify(form.tags))
      api.post(`/api/posts/${form.id}/edit`, formData, config).then(()=>{
        loading.value = false
        router.push({name: 'Profile', params: {alert_title: 'Success', alert_subtitle: 'Post has been updated.'}});
      }).catch( error => {
        loading.value = false
        scrollTo(0,0)
        errors.value = error.response.data.errors
        setTimeout(activeToast, 500)
        setTimeout(activeToast, 5000)
      })
    }
    return { changeForm, updatePost, errors, prevImg, prevData, form, addTag, deleteTag, openCategoryDrop, chooseCategory, categories, loading }
  },
}
</script>
<style>
:root {
  --primary-color: #10b981;
}

/* Progressbar */
.progressbar {
  position: relative;
  display: flex;
  justify-content: space-between;
  counter-reset: step;
  margin: 2rem 0 4rem;
}

.progressbar::before,
.progress {
  content: "";
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  height: 4px;
  width: 100%;
  background-color: #dcdcdc;
}

.progress {
  background-color: var(--primary-color);
  width: 0%;
  transition: width 0.3s ease;
}

.progress-step {
  width: 2.1875rem;
  height: 2.1875rem;
  background-color: #dcdcdc;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1;
}

.progress-step::before {
  counter-increment: step;
  content: counter(step);
}

.progress-step::after {
  content: attr(data-title);
  position: absolute;
  top: calc(100% + 0.5rem);
  font-size: 0.85rem;
  color: #666;
}

.progress-step-active {
  background-color: var(--primary-color);
  color: #f3f3f3;
}

/* Form */

.form-step {
  display: none;
  transform-origin: top;
  animation: anime 0.5s;
}

.form-step-active {
  display: block;
}

@keyframes anime {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.openDrop {
  display: block;
}
</style>