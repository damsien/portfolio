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
      let adaptiveSpeed = (parseFloat(speed) * window.innerWidth) / window.innerWidth;
      element.style.transform = `translate(${translateX}, ${scroll * adaptiveSpeed}px)`;
    });
  }));
  window.addEventListener('mousemove', ((e) => {
    let mousex = window.innerWidth/2 - (e.clientX);
    let mousey = (window.innerHeight/2 - (e.clientY))/50;

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
        <div id="main-bg" class="dark:text-white text-black w-full">

            <div class="w-full h-0.5 dark:bg-gray-200 bg-gray-900"></div>
            <div id="title" class="6xl:h-96 lg:h-80 h-64 pt-20 overflow-hidden">
                <div class="w-fit mx-auto z-10">
                    <p class="6xl:text-11xl 4xl:text-10xl lg:text-9xl mm:text-7xl 2mm:text-6xl text-5xl font-bold text-gray-800 dark:text-white tracking-tight">Experience</p>
                    <div id="exp-title-bar" class="mt-7 bg-gray-800 dark:bg-white xs:h-2 h-1"></div>
                </div>
                <div>
                    <div id="bubble1t" class="bubble"></div>
                    <div id="bubble2t" class="bubble"></div>
                    <div id="bubble3t" class="bubble"></div>
                </div>
            </div>


            <div id="main-parallax" class="relative w-full overflow-y-hidden">
              <div class="absolute w-full overflow-hidden" style="height: 10000px;">
                <div id="bubble1b" class="bubble translate" data-speed="-0.5" data-mspeed="0.2"></div>
                <div id="bubble2b" class="bubble translate" data-speed="-0.7" data-mspeed="0.7"></div>
                <div id="bubble3b" class="bubble translate" data-speed="-0.5" data-mspeed="0.25"></div>
                <div id="bubble4b" class="bubble translate" data-speed="-0.5" data-mspeed="0.2"></div>
                <div id="bubble5b" class="bubble translate" data-speed="-0.7" data-mspeed="0.7"></div>
                <div id="bubble6b" class="bubble translate" data-speed="-0.5" data-mspeed="0.25"></div>
              </div>
              <div class="pt-16 px-4 lg:px-20">
              
                <div id="knu">
                  <div class="grid sm:grid-cols-12 grid-cols-3 h-full gap-8">
                    <div class="col-span-3 block sm:hidden">
                        <p class="font-bold text-6xl 4xl:text-7xl sm:hidden text-center">2023</p>
                    </div>
                    <div class="sm:col-span-3 6xl:col-span-2 col-span-3">
                      <div class="flex sm:hidden mx-auto w-fit">
                        <img class="me-2 h-24 w-24" src="@/assets/experience/knu.png">
                        <p class="font-semibold text-xl w-56">Kyungpook national university</p>
                      </div>
                      <div class="mb-5 sm:block hidden float-right">
                        <div class="flex">
                          <p class="font-semibold text-right pe-5 text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">Kyungpook national university</p>
                          <img class="me-2 h-24 w-24 4xl:w-32 4xl:h-32 6xl:w-36 6xl:h-36" src="@/assets/experience/knu.png">
                        </div>
                      </div>
                    </div>
                    <div class="col-span-3 sm:col-span-6 6xl:col-span-8 font-roboto">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        As part of my university exchange semester, I went to Kyungpook National University in South Korea.
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I continued to study IT, even though the main objective was to immerse myself in the local culture.
                      </p>
                    </div>
                    <div class="col-span-3 6xl:col-span-2">

                      <div>
                        <p class="font-bold 4xl:text-7xl 6xl:text-9xl lg:text-6xl sm:text-4xl hidden sm:inline-block" data-speed="0.1">
                          2023</p>
                        <!-- <div id="year-line" class="year-line-left xl:block hidden" data-speed="0.1"></div> -->
                      </div>
                    </div>
                  </div>
                </div>

              
                <div id="orange" class="mt-36">
                  <div class="grid sm:grid-cols-6 grid-cols-3 h-full gap-8">
                    <div class="col-span-3 sm:col-span-1">
                      <p class="font-bold text-6xl 4xl:text-7xl sm:hidden hidden mm:block text-center">2021-2024</p>
                      <p class="font-bold text-6xl/9 mm:hidden text-center">2024<br />-<br />2021</p>
                      <div id="paral1">
                        <p class="font-bold 4xl:text-7xl 6xl:text-9xl lg:text-6xl sm:text-4xl hidden sm:inline-block translate" data-speed="0.35">
                          2024<span id="year-separator"></span>2021</p>
                        <div id="year-line" class="year-line-right xl:block hidden translate" data-speed="0.35"></div>
                      </div>
                    </div>
                    <div class="block sm:hidden col-span-3 mx-auto">
                      <div class="flex">
                        <img class="me-2 h-24 w-24" src="@/assets/experience/orange.png">
                        <p class="font-semibold text-xl w-56">Orange - First network and telecom company in France</p>
                      </div>
                    </div>
                    <div class="col-span-3 6xl:col-span-4">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I had the opportunity to work for Orange. My main objective was to set up and manage several Kubernetes clusters for projects with different needs. I explored the automation of cluster creation using a GitOps approach. 
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I also created k8s operators and applications as a service (Database aaS, S3 buckets aaS, etc.). 
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        Finally, I was able to exchange ideas with cloud computing organizations.
                      </p>
                    </div>
                    <div class="sm:col-span-2 6xl:col-span-1 col-span-3">
                      <div class="mb-5 sm:block hidden">
                        <div class="flex">
                          <img class="me-2 h-24 w-24 4xl:w-32 4xl:h-32 6xl:w-36 6xl:h-36" src="@/assets/experience/orange.png">
                          <p class="font-semibold text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">Orange - First network and telecom company in France</p>
                        </div>
                      </div>
                      <div class="mx-auto">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/ansible.png" width="42px" class="item-img mb-2.5">Ansible</td>
                            <td class="item"><img src="@/assets/icons/rancher.png" width="60px" class="item-img -mt-3">Rancher</td>
                            <td class="item"><img src="@/assets/icons/operator-sdk.png" width="41px" class="item-img mb-3">OLM</td>
                          </tr>
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/s3.png" width="60px" class="item-img pt-1">S3</td>
                            <td class="item"><img src="@/assets/icons/kubernetes.png" width="50px" class="item-img mb-1">Kubernetes</td>
                            <td class="item"><img src="@/assets/icons/vmware.png" width="45px" class="item-img pt-1 pb-1">VMWare</td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>

                
                <div id="enseeiht" class="mt-20">
                  <div class="grid sm:grid-cols-6 grid-cols-3 h-full gap-8">
                    <div class="col-span-3 sm:col-span-1">

                    </div>
                    <div class="block sm:hidden col-span-3 mx-auto">
                      <div class="flex">
                        <img class="me-2 h-20 w-28" src="@/assets/experience/enseeiht.png">
                        <p class="font-semibold text-xl w-56">ENSEEIHT - Computer science engineering school</p>
                      </div>
                    </div>
                    <div class="col-span-3 6xl:col-span-4">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        These 3 years at ENSEEIHT enabled me to deepen my knowledge of Computer Science, covering all levels (from assembler to application construction). 
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        For example, I learned how to create a programming language using language translation methods. I also deepened my understanding of concurrency in information systems.
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        Finally, I discovered and applied the principles and workings of networking. In particular, I set up a 5G antenna. I also created an Autonomous System (diagram available 
                        <u><a class="link" target="_blank" href="https://viewer.diagrams.net/index.html?tags=%7B%7D&highlight=0000ff&edit=_blank&layers=1&nav=1&title=Network%20project#Uhttps%3A%2F%2Fdrive.google.com%2Fuc%3Fid%3D14oxYKo_yowgQz7ftkVEr3M5HAFPmyzqn%26export%3Ddownload*">here</a>
                        </u>) using the OSPF and BGP protocols.
                      </p>
                    </div>
                    <div class="sm:col-span-2 6xl:col-span-1 col-span-3">
                      <div class="mb-5 sm:block hidden">
                        <div class="flex">
                          <img class="me-2 h-20 w-28" src="@/assets/experience/enseeiht.png">
                          <p class="font-semibold text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">ENSEEIHT - Computer science engineering school</p>
                        </div>
                      </div>
                      <div class="mx-auto">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/java.png" width="47px" class="item-img mb-1">Java</td>
                            <td class="item"><img src="@/assets/icons/asm.png" width="50px" class="item-img">Assembly</td>
                            <td class="item"><img src="@/assets/icons/ocaml.png" width="50px" class="item-img">Ocaml</td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>

              
                <div id="wikicampers" class="mt-36">
                  <div class="grid sm:grid-cols-12 grid-cols-3 h-full gap-8">
                    <div class="col-span-3 block sm:hidden">
                        <p class="font-bold text-6xl 4xl:text-7xl sm:hidden hidden mm:block text-center">2019-2021</p>
                        <p class="font-bold text-6xl/9 mm:hidden text-center">2021<br />-<br />2019</p>
                    </div>
                    <div class="sm:col-span-3 6xl:col-span-2 col-span-3">
                      <div class="flex sm:hidden mx-auto w-fit">
                        <img class="me-2 h-24 w-24" src="@/assets/experience/wikicampers.webp">
                        <p class="font-semibold text-xl w-56">Wikicampers - First motorhome rental company in France</p>
                      </div>
                      <div class="mb-5 sm:block hidden float-right">
                        <div class="flex">
                          <p class="font-semibold text-right pe-5 text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">Wikicampers - First motorhome rental company in France</p>
                          <img class="me-2 h-24 w-24 4xl:w-32 4xl:h-32 6xl:w-36 6xl:h-36" src="@/assets/experience/wikicampers.webp">
                        </div>
                      </div>
                      <div class="mx-auto float-right sm:block hidden">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/symfony.png" width="43px" class="item-img invert-icon">Symfony</td>
                            <td class="item"><img src="@/assets/icons/php.png" width="43px" class="item-img">PHP</td>
                            <td class="item"><img src="@/assets/icons/ionic.png" width="40px" class="item-img">Ionic</td>
                          </tr>
                        </table>
                      </div>
                    </div>
                    <div class="col-span-3 sm:col-span-6 6xl:col-span-8">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        For my first internship, I worked for a young start-up. Its aim is to put people in touch with each other to rent motorhomes. 
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        My role was to help develop the website and application.
                      </p>
                    </div>
                    <div class="col-span-3 6xl:col-span-2">
                      <div class="mx-auto sm:hidden block">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/symfony.png" width="43px" class="item-img invert-icon">Symfony</td>
                            <td class="item"><img src="@/assets/icons/php.png" width="43px" class="item-img">PHP</td>
                            <td class="item"><img src="@/assets/icons/ionic.png" width="40px" class="item-img">Ionic</td>
                          </tr>
                        </table>
                      </div>

                      <div id="paral2">
                        <p class="font-bold 4xl:text-7xl 6xl:text-9xl lg:text-6xl sm:text-4xl hidden sm:inline-block translate" data-speed="0.4">
                          2021<span id="year-separator"></span>2019</p>
                        <div id="year-line" class="year-line-left xl:block hidden translate" data-speed="0.4"></div>
                      </div>
                    </div>
                  </div>
                </div>

                <div id="iut" class="mt-20">
                  <div class="grid sm:grid-cols-12 grid-cols-3 h-full gap-8">
                    <div class="sm:col-span-3 6xl:col-span-2 col-span-3">
                      <div class="flex sm:hidden mx-auto w-fit">
                        <img class="me-2 h-18 w-24" src="@/assets/experience/iut.png">
                        <p class="font-semibold text-xl w-56">University Institute of Technology</p>
                      </div>
                      <div class="mb-5 sm:block hidden float-right">
                        <div class="flex">
                          <p class="font-semibold text-right pe-5 text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">University Institute of Technology</p>
                          <img class="me-2 h-18 w-24 lg:h-12 4xl:h-16" src="@/assets/experience/iut.png">
                        </div>
                      </div>
                      <div class="mx-auto float-right sm:block hidden">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/java.png" width="47px" class="item-img mb-1">Java</td>
                            <td class="item"><img src="@/assets/icons/python.png" width="40px" class="item-img mt-2 mb-1">Python</td>
                            <td class="item"><img src="@/assets/icons/c.png" width="40px" class="item-img mb-1 mt-3"><p>C</p></td>
                          </tr>
                        </table>
                      </div>
                    </div>
                    <div class="col-span-3 sm:col-span-6 6xl:col-span-8">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I studied IT for two years in this IUT. It enabled me to acquire the fundamentals of information systems. 
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I did a lot of hands-on work on real projects with real customers.
                      </p>
                    </div>
                    <div class="col-span-3 6xl:col-span-2">
                      <div class="mx-auto sm:hidden block">
                        <table class="items-group lg:inline-grid mx-auto" data-step="3">
                          <tr class="text-center">
                            <td class="item"><img src="@/assets/icons/java.png" width="47px" class="item-img mb-1">Java</td>
                            <td class="item"><img src="@/assets/icons/python.png" width="40px" class="item-img mt-2 mb-1">Python</td>
                            <td class="item"><img src="@/assets/icons/c.png" width="40px" class="item-img mb-1 mt-3"><p>C</p></td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
                
              
                <div id="insa" class="mt-36 mb-20">
                  <div class="grid sm:grid-cols-6 grid-cols-3 h-full gap-8">
                    <div class="col-span-3 sm:col-span-1">
                      <p class="font-bold text-6xl 4xl:text-7xl sm:hidden text-center">2019</p>
                      <div>
                        <p class="font-bold 4xl:text-7xl 6xl:text-9xl lg:text-6xl sm:text-4xl hidden sm:inline-block" data-speed="0.1">
                          2019</p>
                        <div id="year-line" class="year-line-right xl:block hidden" data-speed="0.1"></div>
                      </div>
                    </div>
                    <div class="block sm:hidden col-span-3 mx-auto">
                      <div class="flex">
                        <img class="me-2 h-18 w-24" src="@/assets/experience/insa.png">
                        <p class="font-semibold text-xl w-56">General engineering school</p>
                      </div>
                    </div>
                    <div class="col-span-3 6xl:col-span-4">
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I was accepted at INSA and started my adventure as soon as I graduated from high school. I learned a lot of mathematical concepts.
                      </p>
                      <p class="text-left text-lg 4xl:text-2xl 6xl:text-3xl">
                        I realized that it wasn't what I was looking for, so I decided to continue my studies at an IUT.
                      </p>
                    </div>
                    <div class="sm:col-span-2 6xl:col-span-1 col-span-3">
                      <div class="mb-5 sm:block hidden">
                        <div class="flex">
                          <img class="me-2 h-18 w-24 4xl:h-16" src="@/assets/experience/insa.png">
                          <p class="font-semibold text-xl 6xl:text-3xl/[35px] 4xl:text-3xl/[30px] w-52">General engineering school</p>
                        </div>
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


#paral1 {
  top: -260px;
}
@media (min-width: 900px) {
  #paral1 {
    top: -220px;
  }
}
@media (min-width: 1000px) {
  #paral1 {
    top: -80px;
  }
}
/* @media (min-width: 1150px) {
  #paral1 {
    top: -100px;
  }
} */
@media (min-width: 1300px) {
  #paral1 {
    top: -100px;
  }
}
/* @media (min-width: 1800px) {
  #paral1 {
    top: -100px;
  }
} */

#paral2 {
  top: -1150px;
}
@media (min-width: 900px) {
  #paral2 {
    top: -600px;
  }
}
@media (min-width: 1070px) {
  #paral2 {
    top: -420px;
  }
}
@media (min-width: 1150px) {
  #paral2 {
    top: -450px;
  }
}
@media (min-width: 1300px) {
  #paral2 {
    top: -490px;
  }
}
@media (min-width: 1800px) {
  #paral2 {
    top: -520px;
  }
}
/* @media (min-width: 2200px) {
  #paral2 {
    top: -520px;
  }
} */



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


.year-line-right {
  float: right;
  right: 0px;
}
@media (min-width: 1400px) {
  .year-line-right {
    float: right;
    right: 15px;
  }
}
.year-line-left {
  float: left;
  left: -15px;
}

#year-line {
  position: relative;
  top: 20px;
  background-color: rgba(255, 255, 255, 0.511);
  height: 100px;
  width: 0.5px;
}
@media (min-width: 2200px) {
  #year-line {
    height: 200px;
  }
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
    width: 100%;
    animation: 7s infinite alternate cubic-bezier(.65,.29,.27,.9) exp-title-bar;
}
@keyframes exp-title-bar {
  0% {
    transform: scale(0.15, 1);
  }
  33% {
    transform: scale(1, 1);
  }
  66% {
    transform: scale(0.35, 1);
  }
  100% {
    transform: scale(0.8, 1);
  }
}

#bubble1b {
  filter: blur(20px);
  width: 220px;
  height: 220px;
  background-color: rgba(0, 255, 102, 0.626);
  top: 200px;
  left: 10%;
}
@media (min-width: 1400px) {
  #bubble1b {
    width: 400px;
    height: 400px;
    left: 20%;
  }
}

#bubble2b {
  filter: blur(50px);
  width: 200px;
  height: 200px;
  background-color: rgba(0, 255, 255, 0.6);
  top: 1000px;
  left: 40%;
}
@media (min-width: 1400px) {
  #bubble2b {
    width: 500px;
    height: 500px;
    left: 60%;
  }
}

#bubble3b {
  filter: blur(25px);
  width: 350px;
  height: 350px;
  background-color: rgba(255, 0, 170, 0.4);
  top: 1300px;
  left: 15%;
}

#bubble4b {
  filter: blur(20px);
  width: 210px;
  height: 210px;
  background-color: rgba(0, 255, 255, 0.6);
  top: 1750px;
  left: 15%;
}
@media (min-width: 1400px) {
  #bubble4b {
    width: 400px;
    height: 400px;
    left: 60%;
  }
}


#bubble5b {
  filter: blur(50px);
  width: 500px;
  height: 500px;
  background-color: rgba(255, 0, 170, 0.4);
  top: 2200px;
  left: 60%;
}

#bubble6b {
  filter: blur(25px);
  width: 350px;
  height: 350px;
  background-color: rgba(0, 255, 102, 0.626);
  top: 2600px;
  left: -15%;
}
@media (min-width: 1400px) {
  #bubble6b {
    width: 350px;
    height: 350px;
    left: 15%;
  }
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
    transform: translate(110%, -20%);
  }
  50% {
    transform: translate(60%, -80%);
  }
  100% {
    transform: translate(5%, 20%);
  }
}
#bubble2t {
    background-color: rgba(0, 224, 71, 0.749);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble2t;
}
@keyframes bubble2t {
  0% {
    transform: translate(90%, -5%);
  }
  50% {
    transform: translate(175%, 10%);
  }
  100% {
    transform: translate(25%, -45%);
  }
}
#bubble3t {
    background-color: rgba(66, 107, 255, 0.944);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble3t;
}
@keyframes bubble3t {
  0% {
    transform: translate(0%, 0%);
  }
  50% {
    transform: translate(50%, 5%);
  }
  100% {
    transform: translate(187%, -25%);
  }
}

#main-bg {
  background: linear-gradient(180deg, rgba(232,230,255,1) 0%, rgba(255,255,255,1) 50%);
}
:is(.dark #main-bg) {
  background: linear-gradient(180deg, rgba(3,0,47,1) 0%, rgba(0,0,0,1) 50%);
}

</style>