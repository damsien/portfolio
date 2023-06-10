<script setup lang="ts">
import Projects from './components/Projects.vue'
import Welcome from './components/Welcome.vue'
import Navbar from './components/Navbar.vue'
import './assets/tailwind.css'
import Experience from './components/Experience.vue'

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

    <header id="welcome" class="h-12 z-40 dark:bg-black bg-white">
      <Navbar id="navbar" class="fixed w-full" />
    </header>

    <main>
      <div id="projects"><span id="thefirstsep" class="bg-gray-800 dark:bg-gray-100 sm:h-96 h-80"></span></div>
      <Welcome class="relative" msg="You did it!" />
      <!-- <div id="thefirstline"></div> -->
      <Projects msg="You did it!" />
      <Experience />
    </main>

  </div>
</template>

<style scoped>

#navbar {
  backdrop-filter: blur(8px);
}

#projects {
  position: absolute;
  overflow: hidden;
  height: 600px;
  width: 100%;
  top: 645px;
  padding-top: 50px;
}
@media (min-width: 2200px) {
  #projects {
    top: 1250px;
  }
}

#thefirstsep {
  position: absolute;
  z-index: 8;
  transform: rotate(-3deg) translateX(-50px);
  width: 150%;
}

/* #thefirstline {
  height: 0px;
  box-shadow: 0px 0px 50px 20px #40ffa6;
  z-index: 5;
  animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) thefirstline;
}
@keyframes thefirstline {
  0% {
    box-shadow: 0px 0px 50px 20px #40ffa6;
  }
  50% {
    box-shadow: 10px -15px 50px 30px #40ffa6;
  }
  100% {
    box-shadow: -10px 15px 50px 25px #40ffa6;
  }
} */

</style>
