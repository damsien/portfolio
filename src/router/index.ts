import { createRouter, createWebHistory } from 'vue-router'
// @ts-ignore
import App from '../App.vue';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'index',
      component: App
    }
  ]
})

export default router;