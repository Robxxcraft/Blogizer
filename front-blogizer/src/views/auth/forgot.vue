<template>
    <div class="body-bg md:h-screen md:py-8">
    <main class="bg-white max-w-lg mx-auto px-8 py-auto md:rounded md:shadow-2xl h-screen md:h-full relative">
        <div v-if="alert" class="absolute inset-x-0 w-full text-sm bg-green-100 border-b border-green-400 text-green-800 px-3 py-1.5 rounded-md shadow-sm" role="alert">
            <div class="flex justify-between">
                <div class="flex flex-row items-center">
                    <div class="py-1 mr-4"><svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><polyline points="20 6 9 17 4 12"></polyline></svg></div>
                    <p class="tracking-wide">{{alert}}</p>
                </div>
                <div class="flex items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="square" stroke-linejoin="arcs"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </div>
            </div>
        </div>
        <section class="pt-8">
            <header class="mx-8 flex justify-center items-center text-green-500">
                <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="28px" height="28px" viewBox="0 0 655.000000 748.000000" preserveAspectRatio="xMidYMid meet"><g transform="translate(0.000000,748.000000) scale(0.100000,-0.100000)" fill="currentColor" stroke="none"> <path d="M5361 6758 c-253 -381 -671 -1012 -930 -1403 -258 -390 -894 -1351 -1413 -2134 -519 -783 -946 -1429 -950 -1436 -5 -9 90 -77 310 -223 175 -116 323 -212 330 -214 6 -2 176 245 376 547 200 303 466 703 589 890 124 187 413 624 643 970 229 347 481 727 559 845 78 118 261 395 407 615 896 1353 1188 1796 1187 1803 0 5 -399 272 -620 415 l-29 19 -459 -694z"/><path d="M4057 6772 c-8 -9 -48 -69 -89 -132 -41 -63 -362 -547 -713 -1075 -351 -528 -693 -1043 -760 -1145 -67 -102 -395 -597 -730 -1100 -334 -503 -609 -920 -612 -926 -4 -11 793 -547 807 -542 7 3 181 263 1078 1616 704 1061 1070 1611 1449 2182 210 316 384 582 387 590 4 10 -19 32 -77 69 -756 500-725 480 -740 463z"/><path d="M1317 4360 c-532 -798 -967 -1452 -967 -1455 0 -3 155 -108 345 -235 l345 -230 961 1442 c529 793 964 1449 966 1458 2 10 -95 80 -313 225 -174 116 -329 218 -343 227 l-28 18 -966 -1450z"/><path d="M206 2688 c-7 -37 -99 -2659 -93 -2665 6 -5 119 43 1502 641 528 228 961 419 962 423 1 4 -51 44 -115 87 -64 44 -592 404 -1172 801 -580 396 -1060 724 -1067 728 -8 5 -14 0 -17 -15z"/></g></svg>
                <h1 class="ml-2 text-2xl font-bold text-center">Blogizer</h1>
            </header>
            <p class="text-gray-500 pt-4 text-center">Send your reset password confirmation.</p>
        </section>
        <section class="mt-24">
            <form @submit.prevent="sendemail">
                <div class="grid grid-cols-1 gap-8">
                    <div class="mb-2">
                        <label class="block text-left text-gray-700 transition duration-500 text-sm font-bold mb-2 ml-3">Email</label>
                        <input type="email" v-model="form.email" class="bg-gray-100 py-2 mb-2 rounded w-full text-gray-700 focus:outline-none border-2 focus:border-green-300 transition duration-300 px-3 pb-3">
                        <div v-if="errors.email" class="text-left p-1 text-red-500 hover:text-red-600 text-sm italic">{{errors.email[0]}}</div>
                    </div>
                </div>
                <div class="flex flex-col items-end mt-28">
                    <button class="bg-green-500 hover:bg-green-600 text-white font-bold px-3 py-2 focus:outline-none rounded shadow-lg hover:shadow-xl transition duration-200" type="submit">Send</button>
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
import axios from "../../axios";
export default {
    setup() {
        const form = reactive({
            'email': '',
        });
        const errors = ref({})
        const alert = ref('')
        const sendemail = () => {
            axios.post('/api/forgot', form).then(() => {  
                alert.value = 'Reset Password link sended.'
            }).catch(error => {
                if (error.response.status === 422) {
                    errors.value = error.response.data.errors
                    return;
                }
            })
        }

        return { form, sendemail, errors, alert }
    },
}
</script>
<style scoped>
.body-bg {
    color: #16a085;
    background-image: linear-gradient(315deg, #2cf3a7 0%, #16a085 75%);
}
</style>