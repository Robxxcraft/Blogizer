<template>
    <div class="overflow-hidden">
    <Navigation />
        <main class="py-10 md:py-20 bg-gray-100">
            <div class="md:mx-10 lg:mx-16 flex flex-wrap lg:flex-nowrap lg:gap-4">
                <!-- Main content -->
                <div class="w-full tracking-wide bg-white px-4 md:px-8 py-4 mb-8">
                  <div class="flex items-center justify-between mt-4 mb-6">
                    <div class="font-bold text-sm bg-green-500 hover:bg-green-600 text-white rounded-sm px-1 shadow-sm hover:shadow-md cursor-pointer" @click="back">
                        <svg class="w-7 h-7 md:w-8 md:h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M11.828 12l2.829 2.828-1.414 1.415L9 12l4.243-4.243 1.414 1.415L11.828 12z"/></svg>
                    </div>
                    <template v-if="post.created_at">
                        <div class="font-bold text-sm bg-green-500 text-white px-4 py-1 rounded-sm shadow-sm">
                            {{post.created_at}}
                        </div>
                    </template>
                    <template v-else>
                        <div class="w-36 h-6 animate-pulse bg-gray-200 rounded-sm"></div>
                    </template>
                  </div>
                <template v-if="post.title">
                    <div class="text-lg font-bold text-gray-700 mb-4 truncate three-lines">{{post.title}}.</div>
                </template>
                <template v-else>
                    <div class="h-4 w-80 mb-4 bg-gray-200 animate-pulse"></div>
                </template>
                    <div class="mx-auto mb-6 object-fill rounded-md shadow-sm overflow-hidden photo">
                      <template v-if="post.photo">
                        <img :src="post.photo" class="w-full h-full">
                      </template>
                      <template v-else>
                        <div class="bg-gray-300 h-full flex items-center justify-center">
                          <svg class="w-20 h-20 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                        </div>
                      </template>
                    </div>

                    <div class="flex justify-between items-center">
                        <div class="flex items-center">
                            <div class="mr-2 w-10 h-10 md:w-12 md:h-12 border border-gray-300 rounded-full overflow-hidden shadow-sm">
                                <template v-if="post.userphoto">
                                    <img :src="post.userphoto" alt="Avatar" class="w-full h-full object-cover" />
                                </template>
                                <template v-else>
                                    <div class="w-full h-full bg-white flex justify-center items-center">
                                        <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                    </div>
                                </template>
                            </div>
                            <div class="flex flex-col">
                                <template v-if="post.username">
                                    <div class="font-bold text-gray-800 text-sm">By</div>
                                    <div class="text-gray-700">{{post.username}}</div>
                                </template>
                                <template v-else>
                                    <div class="w-6 h-2 bg-gray-200 animate-pulse mb-2"></div>
                                    <div class="w-12 h-2 bg-gray-200 animate-pulse"></div>
                                </template>
                            </div>
                        </div>
                        <template v-if="post.category">
                            <div class="font-bold text-gray-600 mr-2 uppercase text-sm">{{post.category}}</div>
                        </template>
                        <template v-else>
                            <div class="w-24 h-4 bg-gray-200 animate-pulse"></div>
                        </template>
                    </div>
                    <div class="mt-6 mx-auto">
                        <template v-if="post.content">
                            <div class="content" v-html="post.content"></div>
                        </template>
                        <template v-else>
                            <div class="w-full h-4 bg-gray-200 animate-pulse mb-2"></div>
                            <div class="w-full h-4 bg-gray-200 animate-pulse mb-2"></div>
                            <div class="w-full h-4 bg-gray-200 animate-pulse mb-2"></div>
                            <div class="w-full h-4 bg-gray-200 animate-pulse mb-2"></div>
                        </template>
                    </div>
                    <template v-if="post.tags">
                      <div class="mx-auto">
                        <div class="text-sm font-bold text-gray-700 mt-6 mb-3">Tags</div>
                        <div class="flex items-center flex-wrap gap-2">
                            <template v-for="(tag, index) in post.tags" :key="index">
                                <router-link :to="`/tag/${tag.slug}`">
                                    <div class="px-3 py-1 cursor-pointer text-sm border border-gray-200 rounded-sm transition hover:bg-green-500 hover:text-white">{{tag.name}}</div>
                                </router-link>
                            </template>
                        </div>
                      </div>
                    </template>
                        <div class="flex items-center text-gray-700 mt-12 mb-6 gap-6">
                            <div class="flex items-center">
                                <button :disabled="loading" @click="like(post.id)" class="focus:outline-none cursor-pointer">
                                    <template v-if="post.liked">
                                        <svg :class="`${loading ? 'text-gray-300' : 'text-green-500'} w-5 h-5 md:w-6 md:h-6 mr-2`" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M2 9h3v12H2a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1zm5.293-1.293l6.4-6.4a.5.5 0 0 1 .654-.047l.853.64a1.5 1.5 0 0 1 .553 1.57L14.6 8H21a2 2 0 0 1 2 2v2.104a2 2 0 0 1-.15.762l-3.095 7.515a1 1 0 0 1-.925.619H8a1 1 0 0 1-1-1V8.414a1 1 0 0 1 .293-.707z"/></svg>
                                    </template>
                                    <template v-else>
                                        <svg :class="`${loading ? 'text-gray-300' : 'text-green-500'} w-5 h-5 md:w-6 md:h-6 mr-2`" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M14.6 8H21a2 2 0 0 1 2 2v2.104a2 2 0 0 1-.15.762l-3.095 7.515a1 1 0 0 1-.925.619H2a1 1 0 0 1-1-1V10a1 1 0 0 1 1-1h3.482a1 1 0 0 0 .817-.423L11.752.85a.5.5 0 0 1 .632-.159l1.814.907a2.5 2.5 0 0 1 1.305 2.853L14.6 8zM7 10.588V19h11.16L21 12.104V10h-6.4a2 2 0 0 1-1.938-2.493l.903-3.548a.5.5 0 0 0-.261-.571l-.661-.33-4.71 6.672c-.25.354-.57.644-.933.858zM5 11H3v8h2v-8z"/></svg>
                                    </template>
                                </button>
                                <div class="font-bold">{{post.likes}}</div>
                            </div>

                            <div class="flex items-center">
                                <svg class="w-5 h-5 md:w-6 md:h-6 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M6.455 19L2 22.5V4a1 1 0 0 1 1-1h18a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H6.455zm-.692-2H20V5H4v13.385L5.763 17zM8 10h8v2H8v-2z"/></svg>
                                <div class="font-bold">{{post.comments ? post.comments.length : '0'}}</div>
                            </div>
                        </div>
                        <div class="text-lg text-gray-700 font-bold mb-4">
                            Comments
                        </div>
                        <div class="flex flex-col gap-6 mb-8">
                            <div v-for="(comment, index) in post.comments" :key="index" class="flex">
                                <div>
                                    <div class="w-10 h-10 md:w-12 md:h-12 border border-gray-200 rounded-full mr-3 shadow-sm overflow-hidden">
                                        <template v-if="comment.userphoto">
                                            <img :src="comment.userphoto" alt="Avatar" class="w-full h-full object-cover" />
                                        </template>
                                        <template v-else>
                                            <div class="w-full h-full bg-white flex justify-center items-center">
                                                <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                            </div>
                                        </template>
                                    </div>
                                    <!-- <img src="../assets/img4.jpg" alt="Avatar" class="w-10 h-10 md:w-12 md:h-12 border border-gray-200 rounded-full mr-3 shadow-sm" /> -->
                                </div>
                                <div class="max-w-xl w-full">
                                    <div class="flex justify-between items-center w-full">
                                        <div class="text-gray-800 font-bold">{{comment.username}}
                                            <template v-if="user && comment.user_id == user.id">
                                                <svg @click="deleteComment(comment.id)" class="inline text-red-500 hover:text-red-600 cursor-pointer" @click.prevent="deleteTag(index)" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z"/></svg>
                                            </template>
                                        </div>
                                        <div class="text-xs text-gray-400 font-bold">{{comment.created_at}}</div>
                                    </div>
                                    <div class="inline-block text-sm mt-1 text-gray-600 bg-gray-100 p-3 rounded-lg">{{comment.body}}</div>
                                </div>
                            </div>
                        </div>
                        <div class="flex w-full items-start mt-8" v-if="user">
                            <div class="mr-2 w-10 h-10 md:w-12 md:h-12 border border-gray-300 rounded-full overflow-hidden shadow-sm">
                                <template v-if="user.photo">
                                    <img :src="user.photo" alt="Avatar" class="w-full h-full object-cover" />
                                </template>
                                <template v-else>
                                    <div class="w-full h-full bg-white flex justify-center items-center">
                                        <svg class="w-5 h-5 text-gray-800" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 22h-2v-2a3 3 0 0 0-3-3H9a3 3 0 0 0-3 3v2H4v-2a5 5 0 0 1 5-5h6a5 5 0 0 1 5 5v2zm-8-9a6 6 0 1 1 0-12 6 6 0 0 1 0 12zm0-2a4 4 0 1 0 0-8 4 4 0 0 0 0 8z"/></svg>
                                    </div>
                                </template>
                            </div>
                            <div>
                            </div>
                            <div>
                                <textarea v-model="comment" class="focus:outline-none border-2 focus:border-green-400 rounded text-gray-700 text-sm p-2" placeholder="Add your comment..." cols="25" rows="2"></textarea>
                                <div v-if="errors.body" class="p-1 text-red-500 hover:text-red-600 text-sm italic">{{errors.body[0]}}</div>
                            </div>
                            <div class="ml-4 text-green-400 hover:text-green-500 cursor-pointer" @click="addComment(post.id)"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M1.923 9.37c-.51-.205-.504-.51.034-.689l19.086-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.475.553-.717.07L11 13 1.923 9.37zm4.89-.2l5.636 2.255 3.04 6.082 3.546-12.41L6.812 9.17z"/></svg></div>
                            
                        </div>
                        <div v-else>
                            <div class="text-gray-400 font-bold text-sm">Login to add Your comment</div>
                            <div class="inline-block">
                                <router-link to="/login" class="flex items-center mt-2 bg-green-500 text-white shadow-sm rounded px-2 py-1.5 text-xs hover:shadow-md hover:bg-green-600 transition-color font-bold uppercase">
                                    <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4M10 17l5-5-5-5M13.8 12H3"/></svg>
                                    Login
                                </router-link>
                            </div>
                        </div>
                </div>
                <!-- right sidebar -->
                <div class="right-sidebar mx-4 md:mx-0 md:grid md:grid-cols-2 lg:block gap-8">
                    <div class="bg-white shadow-sm rounded-sm p-4 mb-4 md:mb-0 lg:mb-4">
                        <div class="text-lg md:text-xl font-bold text-gray-700 mb-3 tracking-wide">Related Posts</div>
                        <template v-if="relatedPost.length >= 0">
                            <div class="space-y-3">
                                <div v-for="(related, index) in relatedPost" :key="index">
                                    <router-link :to="`/posts/${related.slug}/details`">
                                        <div class="flex">
                                            <div class="flex-shrink-0 h-16 w-20 rounded overflow-hidden shadow-sm">
                                                <template v-if="related.photo">
                                                    <img :src="related.photo" class="object-cover w-full h-full" alt="postphoto">
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
                                                    {{related.created_at}}
                                                </div>
                                                <div
                                                    class="leading-5 truncate two-lines font-bold text-gray-800 transition-color hover:text-green-500">
                                                    {{related.title}}
                                                </div>
                                            </div>
                                        </div>
                                    </router-link>
                                </div>

                                <div class="cursor-pointer flex items-center text-gray-700 font-bold text-sm uppercase transition hover:text-green-500 pt-1">
                                    <router-link :to="`/categories/${post.category_slug}`">See More...</router-link>
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
                    <div class="w-full bg-white shadow-sm rounded-sm p-4">
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
    </div>
</template>

<script>
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import { onMounted, ref, watch } from '@vue/runtime-core';
import api from '../axios';
import { useRoute, useRouter } from 'vue-router';
import store from "../store/auth";
export default {
    components: {
        Navigation,
        Footers
    },
    setup() {
        const post = ref({})
        const relatedPost = ref([])
        const tags = ref([])
        const comment = ref('')
        const errors = ref({})
        const user = ref({})
        const loading = ref(false)
        const router = useRouter()
        const route = useRoute()

        watch(route,()=>{
            api.get(`/api/posts/${route.params.slug}/details`).then(res => {
                post.value = res.data.data
            })
        })

        onMounted(() => {
            api.get(`/api/posts/${route.params.slug}/details`).then(res => {
                post.value = res.data.data
            })
            api.get(`/api/posts/related/${route.params.slug}`).then(res => {
                relatedPost.value = res.data.data
            })
            api.get('/api/home/tags').then(res => {
                tags.value = res.data.data
            })
            user.value = store.state.user ? store.state.user : ''
        })
        const back = ()=>{
            router.go(-1)
        }
        const like = (id) => {
            loading.value = true
            if (!user.value) {
                return router.push('/login')
            }
            if (post.value.liked) {
                api.post(`/api/posts/${id}/unlike`).then(()=>{
                    post.value.liked = false
                    post.value.likes--
                    loading.value = false
                }).catch(() => {
                    loading.value = false
                })
            } else {
                api.post(`/api/posts/${id}/like`).then(()=>{
                    post.value.liked = true
                    post.value.likes++
                    loading.value = false
                }).catch(() => {
                    loading.value = false
                })
            }
        }
        const addComment = (id)=>{
            loading.value = true
            api.post(`/api/post/${id}/comment`, {body: comment.value}).then(res =>{
                post.value.comments.push({id: res.data, username: user.value.username, user_id: user.value.id, body: comment.value, created_at: 'Just now'})
                comment.value = ''
                loading.value = false
            }).catch(err => {
                errors.value = err.response.data.errors
                loading.value = false
            })
        }

        const deleteComment = (id)=>{
            api.delete(`/api/post/${id}/comment`).then(() =>{
                const index = post.value.comments.findIndex(val => val.id === id)
                post.value.comments.splice(index, 1)
            })
        }

        return { post, relatedPost, tags, back, comment, addComment, deleteComment, errors, like, user, loading}
    },
}
</script>

<style>
@media (min-width: 1200px) {
    .content img {
    margin-left: auto;
    margin-right: auto;
    width: 600px;
    height: 400px;
    border-radius: 0.375rem;
    }
}
@media (max-width: 1199px) {
    img.photo {
        height: 400px;
        width: 100%;
    }
}
@media (max-width: 539px) {
    img.photo {
        height: 200px;
        width: 100%;
    }
    .content img {
    width: auto !important;
    height: auto !important;
    border-radius: 0.375rem;
    }
}
</style>