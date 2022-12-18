import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('../views/Home.vue'),
  },
  {
    path: '/:catchAll(.*)',
    component: () => import('../views/notfound.vue'),
  },

  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/auth/login.vue'),
    meta: {guest: true}
  },
  {
    path: '/register',
    component: () => import('../views/auth/register.vue'),
    meta: {guest: true}
  },
  {
    path: '/forgot',
    component: () => import('../views/auth/forgot.vue'),
    meta: {guest: true}
  },
  {
    path: '/reset',
    component: () => import('../views/auth/reset.vue'),
    meta: {guest: true}
  },
  {
    path: '/categories',
    component: () => import('../views/Categories.vue')
  },
  {
    path: '/categories/:slug',
    name: 'PostsCategory',
    component: () => import('../views/PostsCategory.vue')
  },
  {
    path: '/popular',
    component: () => import('../views/Popular.vue'),
  },
  {
    path: '/posts',
    name: 'Recent',
    component: () => import('../views/ListsPost.vue'),
    props: true
  },
  {
    path: '/posts/:slug/edit',
    component: () => import('../views/EditPost.vue'),
  },
  {
    path: '/profile',
    name: 'Profile',
    component: () => import('../views/Profile.vue'),
    props: true,
    meta: {
      auth: true
    }
  },
  {
    path: '/profile/:id/edit',
    component: () => import('../views/EditProfile.vue'),
    meta: {
      auth: true
    },
  },
  {
    path: '/posts/:slug/details',
    component: () => import('../views/DetailsPost.vue'),
  },
  {
    path: '/posts/add',
    component: () => import('../views/addPost.vue'),
    meta: {
      auth: true, 
    },
  },
  {
    path: '/search',
    name: 'Search',
    component: () => import('../views/Search.vue')
  },
  {
    path: '/tag/:slug',
    component: () => import('../views/Tag.vue')
  },
  {
    path: '/admin',
    component: () => import('../views/admin/defaultadmin.vue'),
    redirect: '/admin/dashboard',
    meta: { admin: true },
    children: [
      {
        path: 'dashboard',
        name: 'dashboard',
        component: () => import('../views/admin/dashboard.vue'),
      },
      {
        path: 'categories',
        name: 'ManageCategory',
        component: () => import('../views/admin/category/manage.vue'),
        props: true
      },
      {
        path: 'categories/create',
        component: () => import('../views/admin/category/create.vue')
      },
      {
        path: 'categories/:id/edit',
        component: () => import('../views/admin/category/edit.vue')
      },
      {
        path: 'posts',
        component: () => import('../views/admin/post/manage.vue')
      },
      {
        path: 'users',
        component: () => import('../views/admin/user/manage.vue')
      },
      {
        path: 'tags',
        name: 'ManageTag',
        component: () => import('../views/admin/tag/manage.vue'),
        props: true
      },
      {
        path: 'tags/:id/edit',
        component: () => import('../views/admin/tag/edit.vue')
      },
      {
        path: 'settings',
        component: () => import('../views/admin/settings.vue')
      },
    ]
  },
]


const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
  scrollBehavior(){
    window.scrollTo(0,0)
  }
})

router.beforeEach(async (to, from, next) => {
  const isAuth = await localStorage.getItem('token')
  // const role = await auth.state.user ? auth.state.user.role : ''
  if (to.matched.some(record => record.meta.auth)) {
    if (isAuth) next()
    else next({path: "/login", query: { requireAuth: true }})
  } else if (to.matched.some(record => record.meta.guest)) {
    if (!isAuth) next()
    else next({path: "/"})
  } else if (to.matched.some(record => record.meta.admin)) {
    if (isAuth) next()
    else next({path: "/"})
  } else {
    next()
  }
})

export default router