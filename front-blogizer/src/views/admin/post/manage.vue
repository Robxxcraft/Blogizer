<template>
      <header class="flex items-center px-4 justify-between">
    <div class="py-4 md:px-4 text-lg text-green-500 font-bold">Manage</div>
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
        <div class="toast mr-2 translate-x-80 p-2 overflow-hidden z-30 fixed right-0 top-12 transform transition duration-500 bg-white rounded border-l-8 w-60 lg:w-72 shadow-md border-green-400 p-4">
            <div class="flex items-center">
                <svg class="text-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M10 15.172l9.192-9.193 1.415 1.414L10 18l-6.364-6.364 1.414-1.414z"/></svg>
                <div class="ml-4">
                <div id="title" class="text-gray-700 text-sm md:text-base"></div>
                <div id="subtitle" class="text-xs md:text-sm text-gray-800"></div>
                </div>
            </div>
        </div>
        <div class="text-xl text-gray-700 font-bold mb-2">Manage Posts</div>
        <div class="flex justify-end mt-4 mb-8">
          <div class="rounded shadow-sm flex">
            <input type="text" v-model="search" class="w-48 md:w-60 lg:w-auto rounded-l p-2 focus:outline-none text-gray-800 tracking-wide" placeholder="Search" @keyup.enter="searching" />
            <button class="bg-green-500 hover:bg-green-600 px-4 py-2 focus:outline-none text-white rounded-r" @click="searching">
              <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            </button>
          </div>
        </div>
        <div class="overflow-auto rounded-lg shadow hidden xl:block">
        <table class="w-full">
            <thead class="text-white border-b-2 border-gray-200 bg-green-500 text-left">
                <th class="p-3 text-sm font-bold tracking-wide">ID</th>
                <th class="p-3 text-sm font-bold tracking-wide">Title</th>
                <th class="p-3 text-sm font-bold tracking-wide">Slug</th>
                <th class="p-3 text-sm font-bold tracking-wide">Photo</th>
                <th class="p-3 text-sm font-bold tracking-wide">Category</th>
                <th class="p-3 text-sm font-bold tracking-wide">Likes</th>
                <th class="p-3 text-sm font-bold tracking-wide">Comments</th>
                <th class="p-3 text-sm font-bold tracking-wide">Tags</th>
                <th class="p-3 text-sm font-bold tracking-wide">User</th>
                <th class="p-3 text-sm font-bold tracking-wide">Created At</th>
                <th class="p-3 text-sm font-bold tracking-wide">Action</th>
            </thead>
            <tbody class="divide-y divide-gray-100 bg-white">
                <template v-if="!sloading">
                  <tr class="row" v-for="(post, index) in posts" :key="index">
                      <td class="p-3 whitespace-nowrap w-8">
                        <router-link to="/">
                          <div class="font-bold text-green-500 hover:text-green-600">
                          {{post.id}}
                          </div>
                        </router-link>
                      </td>
                      <td class="p-3 text-gray-700 w-32">{{post.title}}</td>
                      <td class="p-3 text-gray-700 w-32">{{post.slug}}</td>
                      <td class="p-3 text-gray-700 whitespace-nowrap w-36">
                        <template v-if="post.photo">
                          <img :src="post.photo" class="w-full h-20 rounded-lg object-cover" alt="#">
                        </template>
                        <template v-else>
                          <div class="bg-gray-300 h-full rounded flex items-center justify-center py-3">
                            <svg class="w-6 h-6 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                          </div>
                        </template>
                      </td>
                      <td class="p-3 text-gray-700 whitespace-nowrap w-28">
                        <div class="bg-green-500 text-sm text-center inline-block text-white px-2 py-1 rounded-md shadow-sm">{{post.category}}</div>
                      </td>
                      <td class="p-3 whitespace-nowrap w-12">
                        <div class="bg-green-100 border border-green-500 text-green-500 font-bold text-sm rounded-full shadow-sm px-3 py-1 text-center inline-block">{{post.likes}}</div>
                      </td>
                      <td class="p-3 whitespace-nowrap w-12">
                        <div class="bg-green-100 border border-green-500 text-green-500 font-bold text-sm rounded-full shadow-sm px-3 py-1 text-center inline-block">{{post.comments}}</div>
                      </td>
                      <td class="p-3 text-gray-700 whitespace-nowrap w-24">
                        <div v-for="(tag, index) in post.tags" :key="index" class="rounded-sm shadow-sm bg-white border p-1">{{tag.name}}</div>
                      </td>
                      <td class="p-3 text-gray-700 whitespace-nowrap w-20">{{post.username}}</td>
                      <td class="p-3 text-gray-700 whitespace-nowrap w-36">{{post.created_at}}</td>
                      <td class="p-3">
                        <div>
                          <button @click.prevent="deletePost(post.id)" class="text-red-500 font-bold focus:outline-none hover:text-red-600"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17 6h5v2h-2v13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V8H2V6h5V3a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3zm1 2H6v12h12V8zm-9 3h2v6H9v-6zm4 0h2v6h-2v-6zM9 4v2h6V4H9z"/></svg></button>
                        </div>
                      </td>
                  </tr>
                </template>
                <template v-else>
                  <tr class="text-left animate-pulse row" v-for="i in 5" :key="i">
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                    <td class="px-4 py-2">
                      <div class="w-full rounded-md h-4 bg-gray-200"></div>
                    </td>
                  </tr>
                </template>
            </tbody>
        </table>
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 xl:hidden gap-8">
          <div class="bg-white rounded-lg shadow-sm" v-for="(post, index) in posts" :key="index">
              <div class="w-full h-48 rounded-t-lg overflow-hidden">
                <template v-if="post.photo">
                  <img class="w-full h-full object-cover" :src="post.photo" alt="postphoto">
                </template>
                <template v-else>
                  <div class="bg-gray-300 h-full rounded flex items-center justify-center py-3">
                    <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                  </div>
                </template>
              </div>
              <div class="p-3 flex gap-8 w-full justify-between">
                  <div class="flex flex-col w-full">
                      <div class="flex w-full">
                      <a href="#" class="text-green-500 mr-2 font-bold hover:underline">{{post.id}}</a>
                        <div class="bg-green-500 text-white ml-auto px-3 py-1 rounded-sm text-sm uppercase font-bold mb-2 text-right">{{post.category}}</div>
                      </div>
                        <div class="text-gray-400 text-xs mb-2 font-bold">{{post.created_at}}</div>
                      <div class="text-sm truncate two-lines text-gray-700 mb-1 font-bold truncate two-lines">{{post.title}}</div>
                      <div class="text-gray-500 text-xs mb-4 truncate two-lines">{{post.slug}}</div>
                      <div class="flex gap-2 mb-4">
                        <div v-for="(tag, index) in post.tags" :key="index" class="bg-white border rounded-sm text-gray-700 py-1 px-2 text-xs">{{tag.name}}</div>
                      </div>
                      <div class="flex justify-between text-gray-800">
                        <div class="flex">
                          <div class="flex mr-4">
                            <svg class=" w-5 h-5 md:w-6 md:h-6 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M14.6 8H21a2 2 0 0 1 2 2v2.104a2 2 0 0 1-.15.762l-3.095 7.515a1 1 0 0 1-.925.619H2a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1h3.482a1 1 0 0 0 .817-.423L11.752.85a.5.5 0 0 1 .632-.159l1.814.907a2.5 2.5 0 0 1 1.305 2.853L14.6 8zM7 10.588V19h11.16L21 12.104V10h-6.4a2 2 0 0 1-1.938-2.493l.903-3.548a.5.5 0 0 0-.261-.571l-.661-.33-4.71 6.672c-.25.354-.57.644-.933.858zM5 11H3v8h2v-8z"/></svg>
                            {{post.likes}}
                          </div>
                          <div class="flex">
                            <svg class="w-5 h-5 md:w-6 md:h-6 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M6.455 19L2 22.5V4a1 1 0 0 1 1-1h18a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H6.455zm-.692-2H20V5H4v13.385L5.763 17zM8 10h8v2H8v-2z"/></svg>
                            {{post.comments}}
                          </div>
                        </div>
                        <div>
                          <button @click.prevent="deletePost(post.id)" class="text-red-500 font-bold focus:outline-none hover:text-red-600"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17 6h5v2h-2v13a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V8H2V6h5V3a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v3zm1 2H6v12h12V8zm-9 3h2v6H9v-6zm4 0h2v6h-2v-6zM9 4v2h6V4H9z"/></svg></button>
                        </div>
                      </div>
                  </div>
              </div>
          </div>
        </div>
        <div class="mt-8 flex items-center justify-end space-x-2 text-green-500">
          <button class="h-8 w-8 hover:text-green-800 focus:outline-none" v-if="currentPage > 1" @click="getPosts(currentPage - 1)">
            <svg fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
          </button>
          <div class="space-x-1">
            <template v-for="(page, index) in pagination" :key="index">
              <button :class="page === currentPage ? 'bg-green-500 shadow-sm hover:shadow-lg focus:outline-none text-white border border-green-500 py-1 px-3 rounded' : 'hover:bg-green-500 shadow-sm hover:text-white hover:shadow-lg focus:outline-none border border-green-500 py-1 px-3 rounded'" @click="getPosts(page)">{{page}}</button>
            </template>
          </div>
          <button class="h-8 w-8 hover:text-green-800 focus:outline-none" v-if="nextLink" @click="getPosts(currentPage + 1)">
            <svg fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
          </button>
        </div>
      </section>
</template>

<script>
import { computed, onMounted, ref  } from "vue";
import api from '../../../axios';
export default {
  props: ['alert_title', 'alert_subtitle'],
  setup(props) {
    const side = ()=>{
      document.querySelector("#main").classList.toggle("bright")
      document.querySelector(".sidebar").classList.toggle("-translate-x-full");
    }
    const posts = ref([])
    const currentPage = ref(1);
    const search = ref('')
    const nextLink = ref(null)
    const sloading = ref(false)
    const getPosts = (page) => {
      sloading.value = true
      api.get(`/api/posts?page=${page}&search=${search.value}`).then( res => {
        currentPage.value = page
        posts.value = res.data.data
        nextLink.value = res.data.links.next
        scrollTo(0,0)
        sloading.value = false
      })
    }

    function openTst() {
      document.querySelector('.toast').classList.toggle('translate-x-80')
    }

    function activeToast(){
      openTst()
      document.querySelector('#title').textContent = props.alert_title
      document.querySelector('#subtitle').textContent = props.alert_subtitle
      setTimeout(openTst, 3000)
    }

    onMounted(() => {
      const isSide = document.querySelector('.-translate-x-full')
      if (!isSide) {
        side()
      }
      if (props.alert_title) {
        setTimeout(activeToast, 1000)
      }
      getPosts(currentPage.value)
    })

    const searching = () => {
      currentPage.value = 1
      getPosts(currentPage.value)
    }

    const deletePost = (id)=>{
      openTst()
      document.querySelector('#title').textContent = "Success"
      document.querySelector('#subtitle').textContent = "Post deleted successfully."
      setTimeout(openTst, 3000)
      api.delete(`/api/posts/${id}`)
      getPosts(currentPage.value)
    }

    const pagination = computed(() => {
      let arr = []
      let endLength = currentPage.value+1
      if (!posts.value.next_page_url) {
        endLength = currentPage.value
      }
      for(let pageLength = currentPage.value-1; pageLength <= endLength; pageLength++){
        if (pageLength < 1) {
          continue
        }
        arr.push(pageLength)
      }
      return arr
    })
    return { side, currentPage, pagination, search, searching, nextLink, sloading, posts, getPosts, deletePost }
  },
  emits: ['sides']
}
</script>

<style scoped>
.row {
  background-color: #f5f5f5;
}

.row:nth-child(odd){
  background-color: #e6e6fa;
}
</style>