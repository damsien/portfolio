<script setup lang="ts">
  defineProps<{
    msg: string
  }>()

  window.onload = function() {
    const nodejs = document.querySelectorAll('img.nodejs');
    if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      nodejs.forEach(n => {
        // @ts-ignore
        n.src = '/src/assets/icons/nodejs-dark.png';
      });
    } else {
      nodejs.forEach(n => {
        // @ts-ignore
        n.src = '/src/assets/icons/nodejs-light.png';
      });
    }
  }

</script>

<template>
  <div>
    <div id="main-bg" class="dark:bg-gray-900 bg-gray-200 dark:text-white text-black">

      <p class="lg:text-9xl text-7xl font-bold text-center -top-20 z-10 text-white dark:text-black">Projects</p>

      <!-- Pixel War -->
      <div class="sm:grid sm:grid-cols-2 top-44 flex flex-col-reverse">
        <div class="w-full">
          <div class="mx-auto w-5/6 mb-8">
            <p class="text-left text-lg font-semibold">
              Pixel War is an online game inspired by Reddit r/place. The principle is simple: put pixels on the map to form a drawing.
            </p>
            <p class="text-left text-lg font-semibold">
              The first session I launched welcomed 500 players for 150K pixels placed. The challenge was to ensure the state of the game in real time on all devices. The "real time" part is managed by Redis while the history of the game is stored in Mariadb.
            </p>
            <p class="text-left text-lg font-semibold">
              The stack of the site is quite classical with Nestjs for the api/backend and Vue for the frontend.
            </p>
          </div>
          
          <div class="w-5/6 mx-auto flex flex-col-reverse sm:block">
            <table class="items-group lg:inline-grid">
              <tr class="text-center">
                <td class="item"><img src="../assets/icons/typescript.png">Typescript</td>
                <td class="item"><img src="../assets/icons/nodejs-light.png" width="100px" class="pt-1 nodejs pb-3">Nodejs</td>
                <td class="item"><img src="../assets/icons/mariadb.svg" class="pt-2 pb-4">Mariadb</td>
              </tr>
              <tr class="text-center">
                <td class="item"><img src="../assets/icons/vue.png" class="pt-1">Vue</td>
                <td class="item"><img src="../assets/icons/kubernetes.png" width="70px">Kubernetes</td>
                <td class="item"><img src="../assets/icons/redis.svg" class="pt-1 pb-1">Redis</td>
              </tr>
            </table>

            <div class="lg:inline-grid lg:ms-10 grid lg:grid-cols-none grid-cols-2 mb-7 sm:mb-0">
              <div class="w-full lg:mb-3">
                <img src="../assets/web.png" width="15px" class="inline-block extern-icon">
                <a class="link" href="https://place.inpt.fr" target="_blank"> Open the game</a>
              </div>
              <div>
                <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
                <a class="link" href="https://github.com/Yltaros/rplace-frontend" target="_blank"> Frontend repository</a><br>

                <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
                <a class="link" href="https://github.com/Yltaros/rplace-backend" target="_blank"> Backend repository</a><br>

                <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
                <a class="link" href="https://github.com/Yltaros/rplace-infra" target="_blank"> Helm chart repository</a><br>
              </div>
            </div>
          </div>
        </div>
        <div class="w-full sm:-top-14 mb-12">
          <p class="text-5xl font-semibold text-center -top-14 sm:top-0">Pixel War</p>
          <p class="text-xs text-center -top-14 sm:top-0">2022</p>
          <img src="../assets/projects/pixelwar.png" class="mx-auto mt-4">
        </div>
      </div>

      <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

      <!-- Smartshuffle -->
      <div class="sm:grid sm:grid-cols-2">
        <div class="w-full mb-12">
          <p class="text-5xl font-semibold text-center sm:mb-0 mb-16">Smartshuffle</p>
          <p class="text-xs text-center -top-14 sm:top-0">2020</p>
          <div class="text-center mt-4">
            <img width="175px" src="../assets/projects/smartshuffle1.gif" class="inline-block pe-1">
            <img width="170px" src="../assets/projects/smartshuffle2.jpg" class="inline-block ps-1">
          </div>
        </div>
        <div class="w-full sm:top-14 top-0">
          <div class="mx-auto w-5/6 mb-8">
            <p class="text-left text-lg font-semibold">
              In the world of audio streaming, some music is only uploaded on certain platforms. How to create a playlist with music from different platforms? Smartshuffle answers this need. For now, it is possible to merge playlists from Spotify and Youtube.
            </p>
            <p class="text-left text-lg font-semibold">
              The mobile application was entirely built with the Flutter framework. The challenge was to get to grips with this new way of designing a UI that moves away from classic mobile design frameworks such as React or Ionic.
            </p>
            <br>
            <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
            <a class="link" href="https://github.com/Yltaros/Smartshuffle" target="_blank"> Repository</a><br>
          </div>
          <table class="items-group">
            <tr class="text-center">
              <td class="item"><img src="../assets/icons/flutter.png">Flutter</td>
              <td class="item"><img src="../assets/icons/dart.png">Dart</td>
            </tr>
          </table>
        </div>
      </div>

      <br><br><br><br><br><br>

      <!-- Minja -->
      <div class="sm:grid sm:grid-cols-2 flex flex-col-reverse">
        <div class="w-full sm:top-14 top-0">
          <div class="mx-auto w-5/6 mb-8">
            <p class="text-left text-lg font-semibold">
              Minja is a project realized with the help of 4 other friends. We created a mod for the game Minecraft. The technical challenge was to bring new game mechanics that were not coded in the game.
            </p>
            <p class="text-left text-lg font-semibold">
              The project was carried out in a specific framework in which we used the agile method. The Jira tool helped us a lot in the management of our sprints.
            </p>
            <br>
            <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
            <a class="link" href="https://github.com/Yltaros/Minja" target="_blank"> Repository</a><br>
          </div>
          <table class="items-group">
            <tr class="text-center">
              <td class="item"><img src="../assets/icons/java.png">Java</td>
              <td class="item"><img src="../assets/icons/jira.png">Jira</td>
            </tr>
          </table>
        </div>
        <div class="w-full mb-12">
          <p class="text-5xl font-semibold text-center sm:mb-0 mb-16">Minja</p>
          <p class="text-xs text-center -top-14 sm:top-0">2022</p>
          <img src="../assets/projects/minja.png" width="700px" class="mx-auto mt-4">
        </div>
      </div>

      <br><br><br><br><br><br>

      <!-- Dato -->
      <div class="sm:grid sm:grid-cols-2">
        <div class="w-full mb-12">
          <p class="text-5xl font-semibold text-center sm:mb-0 mb-16">Dato</p>
          <p class="text-xs text-center -top-14 sm:top-0">2021</p>
          <img src="../assets/projects/dato.png" width="700px" class="mx-auto mt-4">
        </div>
        <div class="w-full sm:top-14 top-0">
          <div class="mx-auto w-5/6 mb-8">
            <p class="text-left text-lg font-semibold">
              For this project realized with a friend. The idea was to create a programming language using a language we didn't like. At that time, we had no knowledge of language translation methods. The challenge was to find the most optimal way to process a piece of program written in "Dato".
            </p>
            <br>
            <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
            <a class="link" href="https://github.com/Yltaros/Dato" target="_blank"> Repository</a><br>
          </div>
          <table class="items-group">
            <tr class="text-center">
              <td class="item"><img src="../assets/icons/ada.svg" class="mb-2 ada-lang"></td>
              <td class="item"><img src="../assets/icons/typescript.png">Typescript</td>
            </tr>
          </table>
        </div>
      </div>

    </div>
  </div>
</template>

<style scoped>

.link:hover {
  color: #00b378;
}
:is(.dark .link:hover) {
  color: #00ffaa;
}

.nodejs {
  margin-top: 10px;
}

.item {
  width: 70px;
  height: 70px;
  border-radius: 100px;
  padding: 12px;
  margin: 10px;
  display: inline-block;
}

@media (min-width: 768px) {
  .item {
    width: 150px;
    height: 150px;
  }
}

@media (min-width: 640px) {
  .item {
    padding: 15px;
    width: 100px;
    height: 100px;
  }
}

.items-group {
  border: solid 2px #f0f0f0;
  border-radius: 30px;
  border-collapse: separate;
  padding: 2px;
  margin-left: auto;
  margin-right: auto;
  background-image: linear-gradient(50deg, #ffffff, #e4e0ff);
  box-shadow: 0px 0px 100px 10px #cec5ff;
  animation: 5s infinite alternate light-groups-shadow;
}
@keyframes light-groups-shadow {
  0% {
    box-shadow: 0px 0px 100px 10px #cec5ff;
  }
  100% {
    box-shadow: 0px 0px 80px 20px #cec5ff;
  }
}
:is(.dark .items-group) {
  border: solid 2px #3b3b3b;
  background-image: linear-gradient(50deg, #000000, #090047);
  box-shadow: 0px 0px 100px 10px #0c0051;
  animation: 5s infinite alternate dark-groups-shadow;
}
@keyframes dark-groups-shadow {
  0% {
    box-shadow: 0px 0px 100px 10px #0c0051;
  }
  100% {
    box-shadow: 0px 0px 80px 20px #0c0051;
  }
}

:is(.dark .extern-icon) {
  filter: invert();
}
:is(.dark .ada-lang) {
  filter: invert();
}


</style>
