<template>
  <header class="flex items-center px-4 justify-between">
    <div class="py-4 md:px-4 text-lg text-green-500 font-bold">Dashboard</div>
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
        <div class="grid sm:grid-cols-2 md:grid-cols-3 gap-4">
          <div class="flex bg-white rounded-lg justify-between overflow-hidden shadow-sm">
            <div class="p-4 flex flex-col font-bold">
              <div class="mb-2 text-gray-600">
                Posts
              </div>
              <div class="text-xs text-gray-400">
                Total of all posts
              </div>
            </div>
            <template v-if="counts.posts">
              <div class="p-4 text-gray-600 font-bold">{{counts.posts}}</div>
            </template>
          </div>
          <div class="flex bg-white rounded-lg justify-between overflow-hidden shadow-sm">
            <div class="p-4 flex flex-col font-bold">
              <div class="mb-2 text-gray-600">
                Users
              </div>
              <div class="text-xs text-gray-400">
                Total of all users
              </div>
            </div>
            <template v-if="counts.users">
              <div class="p-4 text-gray-600 font-bold">{{counts.users}}</div>
            </template>
          </div>
          <div class="flex bg-white rounded-lg justify-between overflow-hidden shadow-sm">
            <div class="p-4 flex flex-col font-bold">
              <div class="mb-2 text-gray-600">
                Tags
              </div>
              <div class="text-xs text-gray-400">
                Total of all tags
              </div>
            </div>
            <template v-if="counts.tags">
              <div class="p-4 text-gray-600 font-bold">{{counts.tags}}</div>
            </template>
          </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 jusitfy-center items-center md:gap-8">
          <div class="col-span-2">
            <LineChart :chart-data="lineData" :options="lineOpt" css-classes="chart-container" />
          </div>
          <div>
            <DoughnutChart :chart-data="doughData" css-classes="chart-container" />
          </div>
        </div>
      </section>
</template>

<script>
import { LineChart, DoughnutChart } from "vue-chart-3";
import { Chart, LineController, DoughnutController, ArcElement, CategoryScale, LinearScale, PointElement, LineElement } from "chart.js";
import { computed, ref } from '@vue/reactivity';
import { onMounted } from '@vue/runtime-core';
import api from '../../axios';
Chart.register(LineController, DoughnutController, ArcElement, CategoryScale, LinearScale, PointElement, LineElement)
export default {
  components: {
    LineChart,
    DoughnutChart
  },
  setup() {
    const counts = ref({})
    const chart = ref({})
    function sum(arr){
      let sum = 0;
      arr.forEach(n => {
        return sum += n
      });
      return sum
    }
    const postCount = ref(0)
    const comCount = ref(0)
    const userCount = ref(0)
    const lineData = computed(()=>({
      labels: chart.value.months,
      datasets: [
      {
        label: 'Posts',
        data: chart.value.posts,
        backgroundColor: 'red',
        borderColor: 'red'
      },
      {
        label: 'Comments',
        data: chart.value.comments,
        backgroundColor: 'blue',
        borderColor: 'blue'
      },
      {
        label: 'Users',
        data: chart.value.users,
        backgroundColor: 'orange',
        borderColor: 'orange'
      },
      ]
    }))
    const doughData = computed(()=>({
      labels: ['Posts', 'Comments', 'Users'],
      datasets: [{
        data: [postCount.value, comCount.value, userCount.value],
        backgroundColor: [
          'red',
          'blue',
          'orange'
        ]
      }
      ]
    }))
    onMounted(()=>{
      const isSide = document.querySelector('.-translate-x-full')
      if (!isSide) {
        side()
      }
      api.get('/api/dashboard').then(res => {
        counts.value = res.data
      })
      api.get('/api/chart').then(res => {
        chart.value = res.data
        postCount.value = sum(res.data.posts)
        comCount.value = sum(res.data.comments)
        userCount.value = sum(res.data.users)
      })
    })
    const side = ()=>{
      document.querySelector("#main").classList.toggle("bright")
      document.querySelector(".sidebar").classList.toggle("-translate-x-full");
    }
    const lineOpt = ref({
      responsive: true,
      scales: {
        x: {
          grid: {
            display: false
          }
        },
        y: {
          ticks: {
            precision: 0 
          },
          grid: {
            display: false
          }
        }
      },
      plugins: {
        legend: {
          display: true
        },
      }
    })
  return { counts ,lineData, doughData, lineOpt, side }
  }
}
</script>