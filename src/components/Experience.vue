<script setup lang="ts">
import { onMounted } from 'vue'

var baseY = 0;

onMounted(() => {

  const parralax = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting == true) {
        baseY = window.scrollY;
      }
    })
  })
  const obsElem = document.querySelector('#main-parallax');
  parralax.observe(obsElem as HTMLElement);


  const translate = document.querySelectorAll('.translate');
  
  window.addEventListener('scroll', (() => {
    let scroll = window.scrollY - baseY;

    translate.forEach(el => {
      let element = el as HTMLElement;
      let speed = element.dataset.speed ?? '0';
      let translateX = '0px';
      if (element.style.transform != '') {
        translateX = element.style.transform.split('(')[1].split(',')[0] ?? 0;
      }
      element.style.transform = `translate(${translateX}, ${scroll * parseFloat(speed)}px)`;
    });
  }));
  window.addEventListener('mousemove', ((e) => {
    let mousex = window.screen.width/2 - (e.clientX);

    translate.forEach(el => {
      let element = el as HTMLElement;
      let mSpeed = element.dataset.mspeed ?? '0';
      let translateY = '0px';
      if (element.style.transform != '') {
        translateY = element.style.transform.split('(')[1].split(',')[1].split(')')[0] ?? 0;
      }
      element.style.transform = `translate(${mousex * parseFloat(mSpeed)}px, ${translateY})`;
    });
  }));
})

</script>


<template>
    <div>
        <div class="dark:bg-black bg-white dark:text-white text-black w-full">

            <div class="w-full h-0.5 dark:bg-gray-200 bg-gray-900"></div>
            <div id="title" class="lg:h-80 h-64 pt-20 overflow-hidden">
                <div class="w-fit mx-auto z-10">
                    <p class="lg:text-9xl text-7xl font-bold text-gray-800 dark:text-white">Experience</p>
                    <div id="exp-title-bar" class="mt-7 bg-gray-800 dark:bg-white h-2"></div>
                </div>
                <div>
                    <div id="bubble1t" class="bubble"></div>
                    <div id="bubble2t" class="bubble"></div>
                    <div id="bubble3t" class="bubble"></div>
                </div>
            </div>


            <div id="main-parallax" class="relative w-full" style="height: 2000px;">
              <div class="absolute w-full overflow-hidden" style="height: 2000px;">
                <div id="bubble1b" class="bubble translate" data-speed="-1" data-mspeed="0.2"></div>
                <div id="bubble2b" class="bubble translate" data-speed="-1.2" data-mspeed="0.7"></div>
                <div id="bubble3b" class="bubble translate" data-speed="-1" data-mspeed="0.25"></div>
              </div>
            </div>
        </div>
    </div>
</template>


<style scoped>



#exp-title-bar {
    animation: 2s infinite alternate cubic-bezier(.65,.29,.27,.9) exp-title-bar;
}
@keyframes exp-title-bar {
  0% {
    float: left;
    width: 0%;
  }
  49.9% {
    float: left;
  }
  50% {
    float: none;
    width: 100%;
  }
  51.1% {
    float: right;
  }
  100% {
    float: right;
    width: 0%;
  }
}

#bubble1b {
  background-color: rgba(13, 255, 0, 0.4);
  top: 200px;
  left: 20%;
}

#bubble2b {
  background-color: rgba(0, 255, 255, 0.6);
  top: 1000px;
  left: 60%;
}

#bubble3b {
  background-color: rgba(255, 0, 170, 0.4);
  top: 1300px;
  left: 15%;
}


.bubble {
    position: absolute;
    filter: blur(200px);
    border-radius: 50%;
    width: 700px;
    height: 700px;
}

#bubble1t {
    background-color: rgba(248, 97, 195, 0.956);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble1t;
}
@keyframes bubble1t {
  0% {
    left: 10%;
    top: -20%;
  }
  50% {
    left: 5%;
    top: 50%;
  }
  100% {
    left: 60%;
    top: 20%;
  }
}
#bubble2t {
    background-color: rgba(0, 224, 71, 0.749);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble2t;
}
@keyframes bubble2t {
  0% {
    left: 90%;
    top: -20%;
  }
  50% {
    left: 75%;
    top: 10%;
  }
  100% {
    left: 5%;
    top: 10%;
  }
}
#bubble3t {
    background-color: rgba(66, 107, 255, 0.944);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble3t;
}
@keyframes bubble3t {
  0% {
    left: 0%;
    top: 40%;
  }
  50% {
    left: 50%;
    top: 10%;
  }
  100% {
    left: 65%;
    top: 10%;
  }
}


</style>