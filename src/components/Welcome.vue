<script setup lang="ts">
  import $ from 'jquery'

  defineProps<{
    msg: string
  }>()


  $(function() {
    
    let message1 = "I'm a frontend developer";
    let message2 = "I'm a backend developer";
    let message3 = "I'm a devops";
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
        let sentence = $('#developer').html() + msg.charAt(i);
        $('#developer').html(sentence);
        i++;

        if (i < msg.length) {
          setTimeout(() => appendNextCharacter(msg, i), 80); // wait for 1 second
        } else {
          
          
          switch (currentIndex) {
            case 0: {
              $('#frontend').removeClass('opacity-0');
              $('#frontend').removeClass('hide-embed');
              $('#frontend').addClass('show-embed');
              break;
            }
            case 1: {
              $('#backend').removeClass('opacity-0');
              $('#backend').removeClass('hide-embed');
              $('#backend').addClass('show-embed');
              break;
            };
            case 2: {
              $('#devops').removeClass('opacity-0');
              $('#devops').removeClass('hide-embed');
              $('#devops').addClass('show-embed');
              break;
            };
          }

          // the message has been fully written, wait for 5 seconds before removing it
          setTimeout(() => removeNextCharacter(msg.length), 3000);
        }
      }

      function removeNextCharacter(length: number) {
        isRemoving = true;
        let sentence = $('#developer').html();
        sentence = sentence.slice(0, -1); // remove the last character
        $('#developer').html(sentence);

        if (sentence.length > 0) {
          
          
          switch (currentIndex) {
            case 0: {
              $('#frontend').addClass('hide-embed');
              $('#frontend').removeClass('show-embed');
              break;
            }
            case 1: {
              $('#backend').addClass('hide-embed');
              $('#backend').removeClass('show-embed');
              break;
            };
            case 2: {
              $('#devops').addClass('hide-embed');
              $('#devops').removeClass('show-embed');
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
  <div class="dark:dark-background light-background">


    <div id="bubbles" class="absolute w-full welcome overflow-hidden">
      <div id="bubble1"></div>
      <div id="bubble2"></div>
      <div id="bubble3"></div>
      <div id="bubble4"></div>
    </div>
    
    <div class="grid sm:grid-cols-2">
      <div class="w-full top-28 h-72">
        <div class="sm:float-right mx-auto text-left ps-8 sm:ps-0">
          <p class="blend lg:text-9xl text-7xl font-bold">Welcome</p>
          <p class="blend lg:text-5xl text-3xl font-semibold">to my portofolio</p>
          <br><br>
          <p class="blend lg:text-3xl text-xl font-bold">Damien Dassieu</p>

          <div id="dev-container" class="top-8 bg-slate-800 rounded-md
                      outline outline-offset-1 outline-2 py-2 ps-2">
            <p class="text-slate-400 inline">$ </p>
            <p id="developer" class="text-white inline"></p>
            <div id="underscore" class="inline-block bg-slate-400 ms-2 top-1"></div>
          </div>
          <div class="relative">
            <div id="frontend" class="absolute opacity-0 text-lg">✨</div>
            <div id="backend" class="absolute opacity-0 sm:text-lg text-sm dark:text-white text-black"
            >GET <a target="_blank" class="text-blue-600 font-semibold"
              href="https://www.damiendassieu.fr/api/v1/status">https://www.damiendassieu.fr/api/v1/status</a>
            </div>
            <div id="devops" class="absolute opacity-0 text-lg">📦 🐋</div>
          </div>

        </div>

      </div>
      <div class="w-full">
        
      </div>
    </div>


  </div>
</template>

<style scoped>

.blend {
    color: white;
    mix-blend-mode: difference;
}


/* Dev container */

#dev-container {
  position: relative;
  width: 300px;
  height: 40px;
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
    animation: 3s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble1;
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
