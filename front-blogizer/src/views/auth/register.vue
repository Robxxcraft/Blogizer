<template>
    <div class="body-bg md:h-screen md:py-8">
    <main class="bg-white max-w-3xl mx-auto px-8 py-auto md:rounded md:shadow-2xl h-screen md:h-full">
        <section class="pt-8">
            <header class="mx-8 flex justify-center items-center text-green-500">
                <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="28px" height="28px" viewBox="0 0 655.000000 748.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,748.000000) scale(0.100000,-0.100000)" fill="currentColor" stroke="none"> <path d="M5361 6758 c-253 -381 -671 -1012 -930 -1403 -258 -390 -894 -1351 -1413 -2134 -519 -783 -946 -1429 -950 -1436 -5 -9 90 -77 310 -223 175 -116 323 -212 330 -214 6 -2 176 245 376 547 200 303 466 703 589 890 124 187 413 624 643 970 229 347 481 727 559 845 78 118 261 395 407 615 896 1353 1188 1796 1187 1803 0 5 -399 272 -620 415 l-29 19 -459 -694z"/><path d="M4057 6772 c-8 -9 -48 -69 -89 -132 -41 -63 -362 -547 -713 -1075 -351 -528 -693 -1043 -760 -1145 -67 -102 -395 -597 -730 -1100 -334 -503 -609 -920 -612 -926 -4 -11 793 -547 807 -542 7 3 181 263 1078 1616 704 1061 1070 1611 1449 2182 210 316 384 582 387 590 4 10 -19 32 -77 69 -756 500-725 480 -740 463z"/><path d="M1317 4360 c-532 -798 -967 -1452 -967 -1455 0 -3 155 -108 345 -235 l345 -230 961 1442 c529 793 964 1449 966 1458 2 10 -95 80 -313 225 -174 116 -329 218 -343 227 l-28 18 -966 -1450z"/><path d="M206 2688 c-7 -37 -99 -2659 -93 -2665 6 -5 119 43 1502 641 528 228 961 419 962 423 1 4 -51 44 -115 87 -64 44 -592 404 -1172 801 -580 396 -1060 724 -1067 728 -8 5 -14 0 -17 -15z"/></g></svg>
                <h1 class="ml-2 text-2xl font-bold text-center">Blogizer</h1>
            </header>
            <p class="text-gray-500 pt-4 text-center">Create your new an account.</p>
        </section>

        <section class="mt-10">
            <form @submit.prevent="register">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div>
                        <label class="block text-gray-700 text-sm font-bold mb-2 ml-3">Username</label>                
                        <input type="text" v-model="form.username" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3">
                        <div v-if="errors.username" class="absolute p-1 text-red-500 text-sm italic">{{errors.username[0]}}</div>
                    </div>
                    <div>
                        <label class="block text-gray-700 transition duration-500 text-sm font-bold mb-2 ml-3">Email</label>
                        <input type="email" v-model="form.email" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3">
                        <div v-if="errors.email" class="absolute p-1 text-red-500 text-sm italic">{{errors.email[0]}}</div>
                    </div>
                    <div>
                        <label class="block text-gray-700 transition duration-500 text-sm font-bold mb-2 ml-3">Password</label>
                        <div class="relative flex">
                            <input :type="showP ? 'text' : 'password'" v-model="form.password" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3">
                            <div class="absolute right-4 top-3 cursor-pointer" @click="showP = !showP">
                                <template v-if="showP">
                                    <svg class="text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 3c5.392 0 9.878 3.88 10.819 9-.94 5.12-5.427 9-10.819 9-5.392 0-9.878-3.88-10.819-9C2.121 6.88 6.608 3 12 3zm0 16a9.005 9.005 0 0 0 8.777-7 9.005 9.005 0 0 0-17.554 0A9.005 9.005 0 0 0 12 19zm0-2.5a4.5 4.5 0 1 1 0-9 4.5 4.5 0 0 1 0 9zm0-2a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/></svg>
                                </template>
                                <template v-else>
                                    <svg class="text-gray-300" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17.882 19.297A10.949 10.949 0 0 1 12 21c-5.392 0-9.878-3.88-10.819-9a10.982 10.982 0 0 1 3.34-6.066L1.392 2.808l1.415-1.415 19.799 19.8-1.415 1.414-3.31-3.31zM5.935 7.35A8.965 8.965 0 0 0 3.223 12a9.005 9.005 0 0 0 13.201 5.838l-2.028-2.028A4.5 4.5 0 0 1 8.19 9.604L5.935 7.35zm6.979 6.978l-3.242-3.242a2.5 2.5 0 0 0 3.241 3.241zm7.893 2.264l-1.431-1.43A8.935 8.935 0 0 0 20.777 12 9.005 9.005 0 0 0 9.552 5.338L7.974 3.76C9.221 3.27 10.58 3 12 3c5.392 0 9.878 3.88 10.819 9a10.947 10.947 0 0 1-2.012 4.592zm-9.084-9.084a4.5 4.5 0 0 1 4.769 4.769l-4.77-4.769z"/></svg>
                                </template>
                            </div>
                        </div>
                        <div v-if="errors.password" class="absolute p-1 text-red-500 text-sm italic">{{errors.password[0]}}</div>
                    </div>
                    <div>
                        <label class="block text-gray-700 transition duration-500 text-sm font-bold mb-2 ml-3">Password Confirmation</label>
                        <div class="relative flex">
                            <input :type="showPC ? 'text' : 'password'" v-model="form.password_confirmation" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3">
                            <div class="absolute right-4 top-3 cursor-pointer" @click="showPC = !showPC">
                                <template v-if="showPC">
                                    <svg class="text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M12 3c5.392 0 9.878 3.88 10.819 9-.94 5.12-5.427 9-10.819 9-5.392 0-9.878-3.88-10.819-9C2.121 6.88 6.608 3 12 3zm0 16a9.005 9.005 0 0 0 8.777-7 9.005 9.005 0 0 0-17.554 0A9.005 9.005 0 0 0 12 19zm0-2.5a4.5 4.5 0 1 1 0-9 4.5 4.5 0 0 1 0 9zm0-2a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/></svg>
                                </template>
                                <template v-else>
                                    <svg class="text-gray-300" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path fill="none" d="M0 0h24v24H0z"/><path d="M17.882 19.297A10.949 10.949 0 0 1 12 21c-5.392 0-9.878-3.88-10.819-9a10.982 10.982 0 0 1 3.34-6.066L1.392 2.808l1.415-1.415 19.799 19.8-1.415 1.414-3.31-3.31zM5.935 7.35A8.965 8.965 0 0 0 3.223 12a9.005 9.005 0 0 0 13.201 5.838l-2.028-2.028A4.5 4.5 0 0 1 8.19 9.604L5.935 7.35zm6.979 6.978l-3.242-3.242a2.5 2.5 0 0 0 3.241 3.241zm7.893 2.264l-1.431-1.43A8.935 8.935 0 0 0 20.777 12 9.005 9.005 0 0 0 9.552 5.338L7.974 3.76C9.221 3.27 10.58 3 12 3c5.392 0 9.878 3.88 10.819 9a10.947 10.947 0 0 1-2.012 4.592zm-9.084-9.084a4.5 4.5 0 0 1 4.769 4.769l-4.77-4.769z"/></svg>
                                </template>
                            </div>
                        </div>
                        <div v-if="errors.password_confirmation" class="absolute p-1 text-red-500 text-sm italic">{{errors.password_confirmation[0]}}</div>
                    </div>
                </div>
                <div class="flex flex-col items-end mt-14">
                    <button :disabled="loading" class="mt-1 bg-green-500 hover:bg-green-600 text-white font-bold px-3 py-2 focus:outline-none rounded shadow-lg hover:shadow-xl transition duration-200" type="submit">
                        <template v-if="loading">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="margin: 0; display: block; shape-rendering: auto;" width="24" height="24" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid">
                                <circle cx="50" cy="50" fill="none" stroke="#ffffff" stroke-width="10" r="35" stroke-dasharray="164.93361431346415 56.97787143782138">
                                    <animateTransform attributeName="transform" type="rotate" repeatCount="indefinite" dur="1s" values="0 50 50;360 50 50" keyTimes="0;1"></animateTransform>
                                </circle>
                            </svg>
                        </template>
                        <template v-else>
                        Register
                        </template>
                    </button>
                </div>
            </form>
        </section>
        <div class="text-center mt-10 mb-6 pt-2">
        <p class="text-gray-500">Already have an account? <router-link to="/login" class="font-bold text-green-500 hover:underline">Login</router-link>.</p>
    </div>

    <footer class="flex justify-center text-sm space-x-3 text-green-500">
        <a href="#" class="hover:underline">Contact</a>
        <a href="#" class="hover:underline">Privacy</a>
    </footer>
    </main>

    
    </div>
</template>

<script>
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import api from "../../axios";
export default {
    setup() {
        const router = useRouter()
        const showP = ref(false)
        const showPC = ref(false)
        const loading = ref(false)
        const form = reactive({
            'username': '',
            'email': '',
            'password': '',
            'password_confirmation': ''
        });

        let errors = ref({});
 
        const register = () => {
            loading.value = true
            api.post('/api/register', form).then(() => {
                loading.value = false
                router.push({name: "Login", query: {registered: true}})
            }).catch((err) => {
                loading.value = false
                errors.value = err.response.data.errors
            })
        }

        return { form, register, errors, showP, showPC, loading }
    },
}
</script>
<style>
.body-bg {
    background-image: linear-gradient(315deg, #2cf3a7 0%, #16a085 75%);
}
.btn-green{
    background-color: #16a085;
}
</style>