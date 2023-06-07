<script setup lang="ts">
import { onMounted } from 'vue'

var baseY = 10000;

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
        translateX = element.style.transform.split('(')[1].split(',')[0];
      }
      element.style.transform = `translate(${translateX}, ${scroll * parseFloat(speed)}px)`;
    });
  }));
  window.addEventListener('mousemove', ((e) => {
    let mousex = window.screen.width/2 - (e.clientX);
    let mousey = (window.screen.height/2 - (e.clientY))/50;

    translate.forEach(el => {
      let element = el as HTMLElement;
      let mSpeed = element.dataset.mspeed ?? '0';
      let translateY = `${mousey * parseFloat(mSpeed)}px`;
      if (element.style.transform != '') {
        translateY = parseFloat(element.style.transform.split('(')[1].split(', ')[1].split('px)')[0])
                    + (mousey * parseFloat(mSpeed))
                    + 'px';
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
            <div id="title" class="6xl:h-96 lg:h-80 h-64 pt-20 overflow-hidden">
                <div class="w-fit mx-auto z-10">
                    <p class="6xl:text-11xl 4xl:text-10xl lg:text-9xl text-7xl font-bold text-gray-800 dark:text-white">Experience</p>
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
              
              <div class="pt-16 px-10 lg:px-20">
                <div id="orange">
                  <div class="grid sm:grid-cols-6 grid-cols-3 h-full gap-8">
                    <div class="col-span-3 sm:col-span-1">
                      <p class="font-bold text-6xl 4xl:text-7xl sm:hidden text-center translate" data-speed="-0.05">2021-2024</p>
                      <p class="font-bold 4xl:text-7xl 6xl:text-9xl lg:text-6xl sm:text-4xl hidden sm:inline-block translate" data-speed="0.1">
                        2021<span id="year-separator"></span>2024</p>
                      <div id="year-line" class="lg:block hidden translate" data-speed="0.1"></div>
                    </div>
                    <div class="block sm:hidden col-span-3 mx-auto">
                      <div class="flex">
                        <img class="me-2 h-24 w-24" src="../assets/experience/orange.png">
                        <p class="font-semibold text-xl w-56">First network and telecom company in France</p>
                      </div>
                    </div>
                    <div class="col-span-3 6xl:col-span-4">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl font-semibold">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et nisi ac nibh vehicula porttitor vitae in ipsum. Proin efficitur hendrerit tellus at dictum. Donec congue leo eget fermentum hendrerit. Praesent convallis augue enim, quis hendrerit purus cursus eu. Ut non nulla ac ante ultrices ornare vitae at lacus. Mauris pulvinar metus vel libero mollis, ac sagittis est ornare. Sed varius ac lacus sit amet tristique. Mauris rutrum interdum leo, posuere luctus turpis pulvinar sit amet. Praesent bibendum vitae lectus ut ullamcorper.

Duis nec sem tincidunt, finibus metus eu, ultricies sapien. Maecenas consequat sem id tempus facilisis. Fusce eget libero augue. Donec fermentum sapien nec lorem lacinia, in luctus est mattis. In at leo mi. Ut pellentesque nulla vitae ipsum suscipit, ac ornare purus scelerisque. Mauris ac venenatis metus. Sed eget quam ultricies, placerat magna vitae, dictum eros.

Sed non malesuada eros, sit amet tincidunt purus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus vehicula metus ac urna feugiat mollis. Maecenas non sollicitudin ex, vitae vehicula enim. Curabitur placerat mattis fermentum. Suspendisse consectetur dolor ut dolor lobortis, id tincidunt massa tincidunt. Pellentesque ut magna at eros fringilla cursus. Fusce aliquet metus sed rutrum imperdiet. Morbi a elit id ligula bibendum aliquam. Morbi vel augue massa. In vel erat urna. Donec vitae eros pretium nisl venenatis ultricies. Suspendisse potenti. Nulla non rhoncus nisl. Donec sed nisi non tellus bibendum consectetur a nec massa. Nullam a justo eu enim suscipit sagittis.
                      </p>
                    </div>
                    <div class="sm:col-span-2 6xl:col-span-1 col-span-3">
                      <div class="mb-5 sm:block hidden">
                        <div class="flex translate" data-speed="-0.02">
                          <img class="me-2 h-24 w-24 4xl:w-32 4xl:h-32 6xl:w-36 6xl:h-36" src="../assets/experience/orange.png">
                          <p class="font-semibold text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">First network and telecom company in France</p>
                        </div>
                      </div>
                      <div class="mx-auto">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
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
                      </div>
                    </div>
                  </div>
                </div>


              </div>
            </div>
        </div>
    </div>
</template>


<style scoped>



@media (width >= 1300px) {
  .item {
    width: 90px;
    height: 90px;
  }
}

@media (width >= 1023px) and (width >= 1300px) {
  .item {
    width: 75px;
    height: 75px;
  }
}

@media (width >= 800px) and (width < 1023px) {
  .item {
    width: 70px;
    height: 70px;
  }
}

@media (width > 640px) and (width < 800px) {
  .items-group {
    width: 100%;
  }
  .item {
    width: 60px;
    height: 60px;
    font-size: 12px;
    margin: 0;
  }
}

@media (width < 640px) {
  .item {
    padding: 20px;
    width: 100px;
    height: 100px;
    margin: 0;
  }
}

.items-group {
  border: solid 2px #f0f0f0;
  border-radius: 30px;
  border-collapse: separate;
  padding: 2px;
  margin-left: auto;
  margin-right: auto;
  background-color: white;
}
:is(.dark .items-group) {
  border: solid 2px #3b3b3b;
  background-color: black;
}


#year-line {
  position: relative;
  float: right;
  top: 20px;
  right: 15px;
  background-color: rgba(255, 255, 255, 0.511);
  height: 100px;
  width: 0.5px;
}

:is(.dark #year-separator) {
  background-color: white;
}
#year-separator {
  display: block;
  text-align: center;
  margin: 0 auto;
  height: 17px;
  width: 5.5px;
  top: 2px;
  background-color: black;
}



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
  filter: blur(20px);
  width: 400px;
  height: 400px;
  background-color: rgba(0, 255, 102, 0.626);
  top: 200px;
  left: 20%;
}

#bubble2b {
  filter: blur(50px);
  width: 500px;
  height: 500px;
  background-color: rgba(0, 255, 255, 0.6);
  top: 1000px;
  left: 60%;
}

#bubble3b {
  filter: blur(25px);
  width: 350px;
  height: 350px;
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
    transition: 200ms ease-out;
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