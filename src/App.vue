<script setup lang="ts">
import Projects from './components/Projects.vue'
import Welcome from './components/Welcome.vue'
import Navbar from './components/Navbar.vue'
import './assets/tailwind.css'

// On page load or when changing themes, best to add inline in `head` to avoid FOUC
if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
  document.documentElement.classList.add('dark')
} else {
  document.documentElement.classList.remove('dark')
}

// Whenever the user explicitly chooses light mode
localStorage.theme = 'light'

// Whenever the user explicitly chooses dark mode
localStorage.theme = 'dark'

// Whenever the user explicitly chooses to respect the OS preference
localStorage.removeItem('theme')

</script>

<template>
  <div>

    <header class="h-12 z-10">
      <Navbar id="navbar" class="fixed w-full" />
    </header>

    <main id="content" class="dark:bg-slate-800 bg-slate-50">
      <Welcome class="h-screen" msg="You did it!" />
      <Projects class="h-screen" msg="You did it!" />
    </main>

  </div>
</template>

<style scoped>

#navbar {
  backdrop-filter: blur(8px);
}

</style>
