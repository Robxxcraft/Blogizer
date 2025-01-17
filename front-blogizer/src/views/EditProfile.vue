<template>
    <Navigation />
    <main class="py-10 md:py-14 md:py-20 bg-gray-100">
        <div class="md:mx-4 md:mx-16 bg-white p-4">
            <div class="text-xl text-gray-700 font-bold">Edit Profile</div>
                <form @submit.prevent="updateProfile">
                <div class="w-full flex flex-col md:flex-row px-4 pt-4 md:px-8 md:pt-8 md:pb-2">
                    <div class="basis-half">
                        <div class="md:w-96">
                            <label class="block text-gray-700 text-sm font-bold mb-2 ml-3">Username</label>                
                            <input type="text" v-model="form.username" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3">
                            <div v-if="errors.username" class="absolute p-1 text-red-500 text-sm italic">{{errors.username[0]}}</div>
                        </div>
                        <div class="md:w-96 mt-12">
                            <label class="block text-gray-700 text-sm font-bold mb-2 ml-3">Biodata</label>                
                            <textarea v-model="form.biodata" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3" placeholder="Enter your biodata..."></textarea>
                            <div v-if="errors.biodata" class="absolute p-1 text-red-500 text-sm italic">{{errors.username[0]}}</div>
                        </div>
                    </div>
                    <div class="basis-half">
                        <div class="text-gray-700 font-bold mb-2 ml-3">Photo Profile</div>
                            <div class="border border-gray-300 rounded w-40 h-32 md:w-48 md:h-36 shadow-sm overflow-hidden">
                                <template v-if="image">
                                    <img :src="image" class="w-full h-full" alt="Photo">
                                </template>
                                <template v-else>
                                    <div class="bg-gray-300 h-full rounded flex items-center justify-center">
                                        <svg class="w-12 h-12 text-gray-700" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M16 21l-4.762-8.73L15 6l8 15h-7zM8 10l6 11H2l6-11zM5.5 8a2.5 2.5 0 1 1 0-5 2.5 2.5 0 0 1 0 5z"/></svg>
                                    </div>
                                </template>
                            </div>
                            <div class="w-40 md:w-48 custom-inp cursor-pointer bg-emerald-500 my-4 px-2 md:px-4 py-2 text-white text-xs md:text-sm uppercase font-bold tracking-wide rounded-sm">
                                <input type="file" @change="prevImg" accept="image/png, image/jpeg, image/jpg">
                                <svg class="inline mr-2 w-6 h-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M20 5H4v14l9.292-9.294a1 1 0 0 1 1.414 0L20 15.01V5zM2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM8 11a2 2 0 1 1 0-4 2 2 0 0 1 0 4z"/></svg>
                                Change Photo
                            </div>
                        <div class="flex flex-col items-end mt-6 md:mb-auto">
                            <button :disabled="loading" class="bg-emerald-500 hover:bg-green-600 text-white font-bold px-3 py-2 focus:outline-none rounded shadow-lg hover:shadow-xl transition duration-200" type="submit">
                                <template v-if="loading">
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: 0; display: block; shape-rendering: auto;" width="24" height="24" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                                        <circle cx="50" cy="50" fill="none" stroke="#ffffff" stroke-width="10" r="35" stroke-dasharray="164.93361431346415 56.97787143782138">
                                            <animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" values="0 50 50;360 50 50" keyTimes="0;1"></animateTransform>
                                        </circle>
                                    </svg>
                                </template>
                                <template v-else>
                                Update
                                </template>
                            </button>
                        </div>
                    </div>
                </div>
                </form>
        </div>
    </main>
    <Footers />
</template>

<script>
import Navigation from "../components/navigation.vue";
import Footers from "../components/footer.vue";
import auth from "../store/auth";
import api from '../axios';
import { useRouter } from 'vue-router';
import { reactive, ref } from '@vue/reactivity';
import { onMounted } from '@vue/runtime-core';
export default {
    components: {
        Navigation,
        Footers
    },
    beforeEnterRoute(){},
    setup() {
        const router = useRouter()
        const errors = ref({})
        const image = ref(null)
        const loading = ref(false)
        const register = () => {
            api.post('/api/register', form).then(() => {
                router.replace("/login")
            }).catch((err) => {
                errors.value = err.response.data.errors
            })
        }

        const form = reactive({
            username: '',
            biodata: '',
            photo: null
        });

        onMounted(() => {
            form.username = auth.state.user.username
            form.biodata = auth.state.user.biodata
            if (auth.state.user.photo) {
                image.value = auth.state.user.photo
            }
        })
        const prevImg = (event)=> {
            let files = event.target.files[0]
            image.value = URL.createObjectURL(files)
            form.photo = files
        }

        const updateProfile = () => {
            loading.value = true
            const config = {
            headers: {
                'content-type' : 'multipart/form-data'
                }
            }
            let formData = new FormData()
            formData.append('username', form.username)
            formData.append('photo', form.photo)
            formData.append('biodata', form.biodata)
                api.post('/api/profile/update', formData, config).then(()=>{
                    loading.value = false
                    router.replace('/profile')
                }).catch(err => {
                    loading.value = false
                    errors.value = err.response.data.errors
                })
            }

        return { form, image, register, errors, prevImg, updateProfile, loading }
    },
}
</script>

<style>
.custom-inp {
    position: relative;
    border: 0;
    overflow: hidden;
}
.custom-inp input[type="file"]{
    cursor: pointer;
    position: absolute;
    transform: scale(3);
    opacity: 0;
}
</style>