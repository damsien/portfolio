<script setup lang="ts">
import { onMounted } from 'vue'

  defineProps<{
    msg: string
  }>()

  function nodeSwitch() {
    const nodejs = document.querySelectorAll('img.nodejs');
    if (document.documentElement.classList.contains('dark')) {
      nodejs.forEach(n => {
        // @ts-ignore
        n.src = '../assets/icons/nodejs-dark.png';
      });
    } else {
      nodejs.forEach(n => {
        // @ts-ignore
        n.src = '../assets/icons/nodejs-light.png';
      });
    }
  }

  onMounted(() => {
    nodeSwitch()

    const bubble = document.querySelector('#bubble');
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        // @ts-ignore
        let step: number = entry.target.getAttribute('data-step') ?? 0;
        if (entry.isIntersecting == true) {
          // @ts-ignore
          if (parseInt(bubble?.classList[0].split('p')[1]) > step) {
            return;
          } else {
            bubble?.classList.remove(`bstep${step-1}`);
            bubble?.classList.add(`bstep${step}`);
          }
        } else {
          if (bubble?.classList.contains(`bstep${step}`)) {
            bubble?.classList.remove(`bstep${step}`);
            bubble?.classList.add(`bstep${step-1}`);
          }
        }
      })
    })
    const obsElems = document.querySelectorAll('.observe');
    obsElems.forEach((el) => {
      observer.observe(el);
    });

    setTimeout(() => {
      // @ts-ignore
      while (bubble.classList.length > 0) {
        // @ts-ignore
        bubble.classList.remove(bubble.classList.item(0));
      }
      bubble?.classList.add('bstep0');
    }, 1000);




    const blob = document.getElementById('blob');
    var cursorX = 500;

    document.body.onpointermove = event => {
      const { clientX, pageY } = event;
      cursorX = clientX;
      blob?.animate({
        left: `${clientX-100}px`,
        top: `${pageY-(900+250)}px`
      }, {duration: 3000, fill: 'forwards'});
    }
    document.addEventListener('scroll', ((_) => {
      const event = new Event("pointermove");
      // @ts-ignore
      event.pageY = window.pageYOffset + 350;
      // @ts-ignore
      event.clientX = cursorX;
      document.body.dispatchEvent(event);
    }));

  })

</script>

<template>
  <div>
    <div id="main-bg" class="dark:bg-gray-900 bg-gray-200 dark:text-white text-black">
      <div id="bubble" class="bstep0"></div>

      <p id="project-title" class="6xl:text-11xl 4xl:text-10xl lg:text-9xl mm:text-7xl 2mm:text-6xl text-5xl font-bold text-center -top-20 z-10 text-white dark:text-black tracking-tight">Projects</p>
      
      <div class="overflow-hidden">
        <div id="blob" class="hidden sm:block"></div>
        <div class="z-10">

          <!-- Pixel War -->
          <div class="sm:grid sm:grid-cols-2 top-44 flex flex-col-reverse">
            <div class="w-full sm:top-10 top-0">
              <div class="mx-auto w-5/6 mb-8 observe" data-step="2">
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">
                  Pixel War is an online game inspired by Reddit r/place. The principle is simple: put pixels on the map to form a drawing.
                </p><br />
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">
                  The first session I launched welcomed 500 players for 150K pixels placed. The challenge was to ensure the state of the game in real time on all devices. The "real time" part is managed by Redis while the history of the game is stored in Mariadb.
                </p><br />
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">
                  The stack of the site is quite classical with Nestjs for the api/backend and Vue for the frontend.
                </p>
              </div>
              
              <div class="w-5/6 mx-auto flex flex-col-reverse sm:block">
                <table class="items-group lg:inline-grid observe" data-step="3">
                  <tr class="text-center">
                    <td class="item"><img src="@/assets/icons/typescript.png" width="55px" class="item-img mt-1 mb-3">Typescript</td>
                    <td class="item"><img src="@/assets/icons/nodejs-light.png" width="100px" class="item-img mt-1 nodejs mb-3">Nodejs</td>
                    <td class="item"><img src="@/assets/icons/mariadb.svg" class="item-img mt-2 mb-4">Mariadb</td>
                  </tr>
                  <tr class="text-center">
                    <td class="item"><img src="@/assets/icons/vue.png" width="55px" class="item-img mt-1 mb-3">Vue</td>
                    <td class="item"><img src="@/assets/icons/kubernetes.png" width="65px" class="item-img mb-1">Kubernetes</td>
                    <td class="item"><img src="@/assets/icons/redis.svg" width="60px" class="item-img mt-1 mb-1">Redis</td>
                  </tr>
                </table>

                <div class="lg:inline-grid lg:ms-8 grid xl:grid-cols-none grid-cols-2 mb-7 sm:mb-0 sm:top-4 xl:top-0">
                  <div class="w-full lg:mb-3">
                    <img src="@/assets/icons/web.png" class="inline-block extern-icon">
                    <a class="link" href="https://place.inpt.fr" target="_blank"> Open the game</a>
                  </div>
                  <div>
                    <img src="@/assets/icons/github.png" class="inline-block extern-icon">
                    <a class="link" href="https://github.com/Yltaros/rplace-frontend" target="_blank"> Frontend repository</a><br>

                    <img src="@/assets/icons/github.png" class="inline-block extern-icon">
                    <a class="link" href="https://github.com/Yltaros/rplace-backend" target="_blank"> Backend repository</a><br>

                    <img src="@/assets/icons/github.png" class="inline-block extern-icon">
                    <a class="link" href="https://github.com/Yltaros/rplace-infra" target="_blank"> Helm chart repository</a><br>
                  </div>
                </div>
              </div>
            </div>
            <div class="w-full sm:-top-14 mb-12">
              <p class="4xl:text-6xl 6xl:text-7xl mm:text-6xl 2mm:text-5xl text-4xl font-semibold text-center -top-14 sm:top-0 observe" data-step="1">Pixel War</p>
              <p class="text-xs 4xl:text-md 6xl:text-lg text-center -top-14 sm:top-0">2022</p>
              <img src="@/assets/projects/pixelwar.png" class="mx-auto mt-4" id="pixel-war-img">
            </div>
          </div>

          <br><br><br><br><br><br><br><br><br><br><br><br><br><br>

          <!-- Smartshuffle -->
          <div class="sm:grid sm:grid-cols-2">
            <div class="w-full mb-12">
              <p class="4xl:text-6xl 6xl:text-7xl mm:text-6xl 2mm:text-5xl text-4xl font-semibold text-center sm:mb-0 mb-16">Smartshuffle</p>
              <p class="text-xs 4xl:text-md 6xl:text-lg text-center -top-14 sm:top-0">2020</p>
              <div class="text-center mt-4 observe" data-step="4">
                <img id="sm-img1" src="@/assets/projects/smartshuffle1.gif" class="inline-block pe-1">
                <img id="sm-img2" src="@/assets/projects/smartshuffle2.jpg" class="inline-block ps-1">
              </div>
            </div>
            <div class="w-full sm:top-20 top-0">
              <div class="mx-auto w-5/6 mb-8">
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">
                  In the world of audio streaming, some music is only uploaded on certain platforms. How to create a playlist with music from different platforms? Smartshuffle answers this need. For now, it is possible to merge playlists from Spotify and Youtube.
                </p><br />
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold observe" data-step="5">
                  The mobile application was entirely built with the Flutter framework. The challenge was to get to grips with this new way of designing a UI that moves away from classic mobile design frameworks such as React or Ionic.
                </p><br />
                <br>
                <img src="@/assets/icons/github.png" class="inline-block extern-icon">
                <a class="link" href="https://github.com/Yltaros/Smartshuffle" target="_blank"> Repository</a><br>
              </div>
              <table class="items-group">
                <tr class="text-center mx-auto observe" data-step="6">
                  <td class="item"><img src="@/assets/icons/flutter.png" width="65px" class="item-img mt-1 mb-2 pe-2">Flutter</td>
                  <td class="item"><img src="@/assets/icons/dart.png" width="70px" class="item-img">Dart</td>
                </tr>
              </table>
            </div>
          </div>

          <br><br><br><br><br><br>

          <!-- Minja -->
          <div class="sm:grid sm:grid-cols-2 flex flex-col-reverse">
            <div class="w-full sm:top-20 top-0">
              <div class="mx-auto w-5/6 mb-8">
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">
                  Minja is a project realized with the help of 4 other friends. We created a mod for the game Minecraft. The technical challenge was to bring new game mechanics that were not coded in the game.
                </p><br />
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold observe" data-step="8">
                  The project was carried out in a specific framework in which we used the agile method. The Jira tool helped us a lot in the management of our sprints.
                </p>
                <br>
                <img src="@/assets/icons/github.png" class="inline-block extern-icon">
                <a class="link" href="https://github.com/Yltaros/Minja" target="_blank"> Repository</a><br>
              </div>
              <table class="items-group">
                <tr class="text-center observe" data-step="9">
                  <td class="item"><img src="@/assets/icons/java.png" width="60px" class="item-img mb-2">Java</td>
                  <td class="item"><img src="@/assets/icons/jira.png" width="60px" class="item-img mb-2">Jira</td>
                </tr>
              </table>
            </div>
            <div class="w-full mb-12">
              <p class="4xl:text-6xl 6xl:text-7xl mm:text-6xl 2mm:text-5xl text-4xl font-semibold text-center sm:mb-0 mb-16">Minja</p>
              <p class="text-xs 4xl:text-md 6xl:text-lg text-center -top-14 sm:top-0">2022</p>
              <img src="@/assets/projects/minja.png" id="minja-img" class="mx-auto mt-4 observe" data-step="7">
            </div>
          </div>

          <br><br><br><br><br><br>

          <!-- Dato -->
          <div class="sm:grid sm:grid-cols-2">
            <div class="w-full mb-12">
              <p class="4xl:text-6xl 6xl:text-7xl mm:text-6xl 2mm:text-5xl text-4xl font-semibold text-center sm:mb-0 mb-16">Dato</p>
              <p class="text-xs 4xl:text-md 6xl:text-lg text-center -top-14 sm:top-0">2021</p>
              <img src="@/assets/projects/dato.png" id="dato-img" class="mx-auto mt-4 observe" data-step="10">
            </div>
            <div class="w-full sm:top-20 top-0">
              <div class="mx-auto w-5/6 mb-8">
                <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">
                  For this project realized with a friend. The idea was to create a programming language using a language we didn't like. At that time, we had no knowledge of language translation methods. The challenge was to find the most optimal way to process a piece of program written in "Dato".
                </p>
                <br>
                <img src="@/assets/icons/github.png" class="inline-block extern-icon observe" data-step="11">
                <a class="link" href="https://github.com/Yltaros/Dato" target="_blank"> Repository</a><br>
              </div>
              <table class="items-group">
                <tr class="text-center observe" data-step="12">
                  <td class="item"><img src="@/assets/icons/ada.svg" width="60px" class="item-img mb-2 invert-icon">Ada</td>
                  <td class="item"><img src="@/assets/icons/typescript.png" width="55px" class="item-img mb-3 mt-1">Typescript</td>
                </tr>
              </table>
            </div>
          </div>

        </div>
    <br id="experience"><br><br><br><br><br>
      </div>
    </div>
  </div>
</template>

<style scoped>


#dato-img {
  width: 700px;
}
#minja-img {
  width: 700px;
}
#sm-img1 {
  width: 175px;
}
#sm-img2 {
  width: 170px;
}
@media (min-width: 1700px) {
  #dato-img {
    width: 800px;
  }
  #minja-img {
    width: 800px;
  }
  #sm-img1 {
    width: 250px;
  }
  #sm-img2 {
    width: 245px;
  }
  #pixel-war-img {
    width: 500px;
    height: 500px;
  }
}
@media (min-width: 2200px) {
  #dato-img {
    width: 950px;
  }
  #minja-img {
    width: 950px;
  }
  #sm-img1 {
    width: 300px;
  }
  #sm-img2 {
    width: 295px;
  }
  #pixel-war-img {
    width: 700px;
    height: 700px;
  }
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
  background-image: linear-gradient(50deg, #ffffff, #e8fff9);
  box-shadow: 0px 0px 100px 10px #c5fff0;
  animation: 5s infinite alternate light-groups-shadow;
}
@keyframes light-groups-shadow {
  0% {
    box-shadow: 0px 0px 100px 10px #c5fff0;
  }
  100% {
    box-shadow: 0px 0px 80px 20px #c5fff0;
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

:is(.dark #blob) {
  background: linear-gradient(to right, aquamarine, mediumpurple);
  opacity: 0.8;
}
#blob {
  position: absolute;
  background: linear-gradient(to right, aquamarine, rgb(3, 189, 235));
  height: 200px;
  aspect-ratio: 1;
  left: 50%;
  top: 50%;
  translate: -50%, 50%;
  border-radius: 50%;
  animation: rotate-blob 20s infinite;
  opacity: 0.5;
  filter: blur(40px);
}
@keyframes rotate-blob {
  from {
    rotate: 0deg;
  }
  50% {
    scale: 1 1.15;
  }
  to {
    rotate: 360deg;
  }
}
#blur {
  height: 100%;
  width: 100%;
  position: absolute;
  z-index: 1;
  backdrop-filter: blur(50px);
}

#bubble {
  z-index: 7;
  position: absolute;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  transition: 1s cubic-bezier(.79,0,.26,.99);
}

.bstep0 {
  background-color: #ff8503;
  top: 0;
  left: 0;
}
.bstep1 {
  background-color: #ff8503;
  top: 200px;
  left: 20%;
}
.bstep2 {
  background-color: #ff8503;
  top: 900px;
  left: 85%;
}
.bstep3 {
  background-color: #ff8503;
  top: 1300px;
  left: 10%;
}
.bstep4 {
  background-color: #00de25;
  top: 1650px;
  left: 30%;
}
.bstep5 {
  background-color: #00de25;
  top: 2300px;
  left: 10%;
}
.bstep6 {
  background-color: #00de25;
  top: 2700px;
  left: 70%;
}
.bstep7 {
  background-color: #00a3de;
  top: 3000px;
  left: 30%;
}
.bstep8 {
  background-color: #00a3de;
  top: 3500px;
  left: 80%;
}
.bstep9 {
  background-color: #00a3de;
  top: 3800px;
  left: 20%;
}
.bstep10 {
  background-color: #fbff00;
  top: 4000px;
  left: 30%;
}
.bstep11 {
  background-color: #fbff00;
  top: 4300px;
  left: 80%;
}
.bstep12 {
  background-color: #fbff00;
  top: 4600px;
  left: 20%;
}

@media (min-width: 640px) {
  .bstep1 {
    background-color: #ff8503;
    top: 250px;
    left: 20%;
  }
  .bstep2 {
    background-color: #ff8503;
    top: 250px;
    left: 20%;
  }
  .bstep3 {
    background-color: #ff8503;
    top: 525px;
    left: 10%;
  }
  .bstep4 {
    background-color: #00de25;
    top: 1000px;
    left: 30%;
  }
  .bstep5 {
    background-color: #00de25;
    top: 1000px;
    left: 30%;
  }
  .bstep6 {
    background-color: #00de25;
    top: 1300px;
    left: 70%;
  }
  .bstep7 {
    background-color: #00a3de;
    top: 1600px;
    left: 70%;
  }
  .bstep8 {
    background-color: #00a3de;
    top: 1600px;
    left: 70%;
  }
  .bstep9 {
    background-color: #00a3de;
    top: 2000px;
    left: 45%;
  }
  .bstep10 {
    background-color: #fbff00;
    top: 2300px;
    left: 80%;
  }
  .bstep11 {
    background-color: #fbff00;
    top: 2300px;
    left: 80%;
  }
  .bstep12 {
    background-color: #fbff00;
    top: 2650px;
    left: 65%;
  }
}


</style>
