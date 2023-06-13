<script setup lang="ts">
import { onMounted } from 'vue'

  defineProps<{
    msg: string
  }>()


  onMounted(() => {
    
    let message1 = "I'm a frontend developer";
    let message2 = "I'm a backend developer";
    let message3 = "I'm a devops engineer";
    let messages = [message1, message2, message3];

    var currentIndex = 0;
    var isRemoving = false;

    function displayNextMessage() {
      if (isRemoving) {
        // wait until the previous message has been completely removed
        setTimeout(displayNextMessage, 1000);
        return;
      }

      var msg = messages[currentIndex];
      appendNextCharacter(msg, 0);

      function appendNextCharacter(msg: string, i: number) {
        let dev = document.getElementById('developer');
        let sentence = document.getElementById('developer')?.innerHTML + msg.charAt(i);
        //@ts-ignore
        dev.innerHTML = sentence;
        i++;

        if (i < msg.length) {
          setTimeout(() => appendNextCharacter(msg, i), 80); // wait for 1 second
        } else {
          
          
          switch (currentIndex) {
            case 0: {
              document.querySelector('#frontend')?.classList.remove('opacity-0');
              document.querySelector('#frontend')?.classList.remove('hide-embed');
              document.querySelector('#frontend')?.classList.add('show-embed');
              break;
            }
            case 1: {
              document.querySelector('#backend')?.classList.remove('opacity-0');
              document.querySelector('#backend')?.classList.remove('hide-embed');
              document.querySelector('#backend')?.classList.add('show-embed');
              break;
            };
            case 2: {
              document.querySelector('#devops')?.classList.remove('opacity-0');
              document.querySelector('#devops')?.classList.remove('hide-embed');
              document.querySelector('#devops')?.classList.add('show-embed');
              break;
            };
          }

          // the message has been fully written, wait for 5 seconds before removing it
          setTimeout(() => removeNextCharacter(msg.length), 3000);
        }
      }

      function removeNextCharacter(length: number) {
        isRemoving = true;
        let dev = document.getElementById('developer');
        let sentence = document.getElementById('developer')?.innerHTML ?? '';
        sentence = sentence.slice(0, -1); // remove the last character
        //@ts-ignore
        dev.innerHTML = sentence;

        if (sentence.length > 0) {
          
          
          switch (currentIndex) {
            case 0: {
              document.querySelector('#frontend')?.classList.add('hide-embed');
              document.querySelector('#frontend')?.classList.remove('show-embed');
              break;
            }
            case 1: {
              document.querySelector('#backend')?.classList.add('hide-embed');
              document.querySelector('#backend')?.classList.remove('show-embed');
              break;
            };
            case 2: {
              document.querySelector('#devops')?.classList.add('hide-embed');
              document.querySelector('#devops')?.classList.remove('show-embed');
              break;
            };
          }

          setTimeout(() => removeNextCharacter(length), 50); // wait for 1 second
        } else {
          // the message has been completely removed, go to the next one
          currentIndex = (currentIndex + 1) % messages.length;
          isRemoving = false;
          setTimeout(displayNextMessage, 80);
        }
      }
    }

    displayNextMessage(); // start the loop



  })



</script>

<template>
  <div id="welcome-section" class="dark:dark-background light-background">


    <div id="bubbles" class="h-full absolute w-full welcome overflow-hidden">
      <div id="bubble5"></div>
      <div id="bubble2"></div>
      <div id="bubble3"></div>
      <div id="bubble1"></div>
      <div id="bubble4"></div>
    </div>
    
    <div class="grid sm:grid-cols-2">
      <div class="w-full top-1/3 6xl:pt-36 h-72">
        <div class="sm:float-right mx-auto text-left ps-8 sm:ps-0">
          <p class="blend 6xl:text-12xl 4xl:text-10xl lg:text-9xl md:text-8xl xs:text-7xl 2mm:text-6xl text-5xl font-bold">Welcome</p>
          <p class="blend 6xl:text-8xl 4xl:text-6xl lg:text-5xl text-3xl font-semibold">to my portofolio</p>
          <br><br>
          <p class="blend 6xl:text-5xl 4xl:text-4xl lg:text-3xl text-xl font-bold">Hey! I'm Damien Dassieu</p>

          <div id="dev-container" class="top-8 bg-slate-800 rounded-md
                      outline outline-offset-1 outline-2 py-2 ps-2">
            <p class="6xl:text-2xl 4xl:text-lg mm:text-lg text-xs text-slate-400 inline font-space">$ </p>
            <p id="developer" class="6xl:text-2xl 4xl:text-lg mm:text-lg text-xs text-white inline font-space"></p>
            <div id="underscore" class="inline-block bg-slate-400 ms-2 top-1"></div>
          </div>
          <div class="relative">
            <div id="frontend" class="absolute opacity-0 6xl:text-3xl text-lg">✨</div>
            <div id="backend" class="absolute opacity-0 sm:text-lg text-sm 4xl:text-lg 6xl:text-2xl dark:text-white text-black font-space"
            >GET <a target="_blank" class="text-blue-600 font-semibold sm:block hidden"
              href="/api/v1/status">https://www.damiendassieu.fr/api/v1/status</a>
                <a target="_blank" class="text-blue-600 font-semibold sm:hidden block"
              href="/api/v1/status">/api/v1/status</a>
            </div>
            <div id="devops" class="absolute opacity-0 6xl:text-2xl text-lg">📦 🐋</div>
          </div>

        </div>

      </div>
      <div class="w-full">
        
      </div>
    </div>


  </div>
</template>

<style scoped>


#welcome-section {
  height: 900px;
}
@media (min-width: 2200px) {
  #welcome-section {
    height: 1500px;
  }
}

.blend {
    color: white;
    mix-blend-mode: difference;
}


/* Dev container */

#dev-container {
  position: relative;
  width: 75%;
  height: 40px;
}
@media (min-width: 550px) {
  #dev-container {
    width: 300px;
    height: 40px;
  }
}

@media (min-width: 2200px) {
  #dev-container {
    width: 450px;
    height: 50px;
  }
}

#underscore {
  width: 10px;
  height: 3px;
  animation: 1s infinite linear underscore;
}
@keyframes underscore {
  0% {
    background-color: rgb(148 163 184 / 1);
  }
  80% {
    background-color: rgb(148 163 184 / 1);
  }
  100% {
    background-color: rgb(30 41 59 / 1);
  }
}

.show-embed {
  opacity: 0;
  top: 0px;
  animation: fadeIn 0.4s cubic-bezier(.65,.29,.27,.9) forwards;
}
@keyframes fadeIn {
  from {
    top: 0px;
    opacity: 0;
  }
  to {
    top: 40px;
    opacity: 1;
  }
}

.hide-embed {
  opacity: 1;
  top: 40px;
  animation: fadeOut 0.4s cubic-bezier(.65,.29,.27,.9) forwards;
}
@keyframes fadeOut {
  from {
    top: 40px;
    opacity: 1;
  }
  to {
    top: 0px;
    opacity: 0;
  }
}



/* Bubbles */

#bubble1 {
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    left: 15%;
    background-color: rgb(3, 66, 255);
    animation: 3s infinite alternate cubic-bezier(.95,-0.01,.06,.97) bubble1;
}
@keyframes bubble1 {
  0% {
    width: 20px;
    height: 20px;
    top: 10%;
  }
  100% {
    width: 60px;
    height: 60px;
    top: 70%;
  }
}

#bubble2 {
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    top: 20%;
    width: 70px;
    height: 70px;
    background-color: rgb(209, 255, 3);
    animation: 7s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble2;
}
@keyframes bubble2 {
  0% {
    left: 20%;
  }
  100% {
    left: 50%;
  }
}

#bubble3 {
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    top: 30%;
    width: 40px;
    height: 40px;
    background-color: rgb(251, 0, 167);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble3;
}
@keyframes bubble3 {
  0% {
    left: 10%;
  }
  100% {
    left: 35%;
  }
}

#bubble4 {
    position: relative;
    filter: blur(200px);
    border-radius: 50%;
    width: 700px;
    height: 700px;
    background-color: rgba(251, 0, 163, 0.5);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble4;
}
@keyframes bubble4 {
  0% {
    left: 10%;
    top: 0%;
  }
  50% {
    left: 35%;
    top: 60%;
  }
  100% {
    left: 60%;
    top: 20%;
  }
}

#bubble5 {
    opacity: 0;
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    left: 15%;
    background-color: rgb(3, 66, 255);
    animation: 3s infinite alternate cubic-bezier(.45,0,.56,1) bubble5;
}
@keyframes bubble5 {
  0% {
    width: 0px;
    height: 0px;
  }
  100% {
    width: 120px;
    height: 120px;
  }
}


/* Background */

:is(.dark .dark\:dark-background) {
  background-image: radial-gradient(circle, #000000 60%, #40ffa6);
  background-size: 350%;
  animation: 5s infinite alternate darkbganim;
}

@keyframes darkbganim {
  0% {
    background-position: left 50% bottom 0%;
  }
  100% {
    background-position: left 15% bottom 50%;
  }
}

.light-background {
  background-image: radial-gradient(circle, #ffffff 60%, #40ffa6);
  background-position: left 100% bottom 100%;
  background-size: 200%;
  animation: 5s forwards infinite alternate lightbganim;
}

@keyframes lightbganim {
  0% {
    background-position: left 100% bottom 100%;
  }
  100% {
    background-position: left 0% bottom 0%;
  }
}

</style>
