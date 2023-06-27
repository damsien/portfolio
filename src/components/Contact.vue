<script setup lang="ts">
import { onMounted } from 'vue'

    onMounted(() => {
        // @ts-ignore
        document.getElementById('sendForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission and page reload
            
            document.getElementById('sendText')?.classList.add('hidden')
            document.getElementById('loading')?.classList.remove('hidden')

            // @ts-ignore
            const name = document.getElementById('name').value
            // @ts-ignore
            const email = document.getElementById('email').value
            // @ts-ignore
            const message = document.getElementById('message').value

            const formData = {
                name: name,
                email: email,
                message: message
            }

            if (document.getElementById('submit')?.innerHTML != 'Sent!') {

                fetch('/api/v1/send', {
                    method: 'POST',
                    body: JSON.stringify(formData)
                })
                    .then(response => {

                        // Handle response as needed
                        if (response.ok) {
                            // @ts-ignore
                            document.getElementById('submit').innerHTML = 'Sent!'
                            document.getElementById('submit')?.classList.add('submited')
                        } else {
                            // @ts-ignore
                            document.getElementById('submit').innerHTML = 'Sent!'
                            document.getElementById('submit')?.classList.add('submited')
                        }

                        setTimeout(function(){
                            document.getElementById('sendText')?.classList.remove('hidden')
                            document.getElementById('loading')?.classList.add('hidden')
                        }, 5000);
                    })
                    .catch(error => {
                        // @ts-ignore
                        document.getElementById('submit').innerHTML = 'Sent!'
                        document.getElementById('submit')?.classList.add('submited')

                        setTimeout(function(){
                            document.getElementById('sendText')?.classList.remove('hidden')
                            document.getElementById('loading')?.classList.add('hidden')
                        }, 5000);
                    });
            }
        });



        const letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ$%§#";

        // @ts-ignore
        var interval = null;

        // @ts-ignore
        document.getElementById("contact-title").onclick = event => {  
            // @ts-ignore
            hackEffect(interval, letters);
        }

        
        const hackEnter = new IntersectionObserver((entries) => {
            entries.forEach((entry) => {
                // @ts-ignore
                hackEffect(interval, letters)
            })
        })
        const obsElem = document.querySelector('#contact-title');
        hackEnter.observe(obsElem as HTMLElement);

    })

    // @ts-ignore
    function hackEffect(interval, letters) {
        let iteration = 0;
            
        // @ts-ignore
        clearInterval(interval);
        
        interval = setInterval(() => {
            // @ts-ignore
            document.querySelector('#contact-title').innerText = document.querySelector('#contact-title').innerText
            .split("")
            // @ts-ignore
            .map((letter, index) => {
                if(index < iteration) {
                // @ts-ignore
                return document.querySelector('#contact-title').dataset.value[index];
                }
            
                return letters[Math.floor(Math.random() * 30)]
            })
            .join("");
                
            // @ts-ignore
            if(iteration >= document.querySelector('#contact-title').dataset.value.length){ 
                // @ts-ignore
                clearInterval(interval);
            }
                
                iteration += 1 / 3;
        }, 30);
    }

</script>

<template>
    <div class="w-full h-0.5 dark:bg-gray-200 bg-gray-900" id="contact"></div>
    <div class="pb-36 bg-white dark:bg-black font-space">
        <div class="pt-10 pb-16 text-center">
            <p
                style="cursor: pointer;"
                data-value="contact_me"
                id="contact-title" 
                class="w-fit mx-auto 6xl:text-11xl 4xl:text-10xl lg:text-9xl mm:text-7xl 2mm:text-6xl text-5xl
                 font-bold text-gray-800 dark:text-white tracking-tight"
            >contact_me</p>
        </div>

        <div class="text-center mb-10 6xl:text-2xl 4xl:text-xl">
            <div class="inline-block me-5">
                <a target="_blank" href="https://github.com/Damsien" class="text-gray-800 dark:text-white"><img class="mx-auto invert-icon w-9 6xl:w-20 4xl:w-16" src="@/assets/icons/github.png" />My Github</a>
            </div>
            <div class="inline-block ms-5">
                <a target="_blank" href="https://www.linkedin.com/in/damien-dassieu-7700b61b7/?locale=en_US" class="text-gray-800 dark:text-white"><img class="mx-auto invert-icon top-1 6xl:top-2 w-11 6xl:w-24 4xl:w-20" src="@/assets/icons/linkedin.png" />My Linkedin</a>
            </div>
        </div>

        <div class="lg:w-1/3 sm:w-2/3 w-4/5 mx-auto text-xl 4xl:text-2xl 6xl:text-3xl">
            <form id="sendForm">
                <div>
                    <label for="name" class="text-gray-800 dark:text-white">Your name</label>
                    <input type="text" name="name" id="name" required
                    class="w-full mt-1 p-2 dark:bg-gray-900 dark:text-white focused">
                </div>
                <div class="mt-3">
                    <label for="email" class="text-gray-800 dark:text-white">Your email</label>
                    <input type="text" name="email" id="email" pattern="^[^ ]+@[^ ]+\.[a-z]{2,6}$" required
                    class="w-full mt-1 border-gray-700 dark:border-gray-200 p-2 dark:bg-gray-900 dark:text-white focused">
                </div>
                <div class="mt-3">
                    <label for="message" class="text-gray-800 dark:text-white">Your message</label>
                    <textarea id="message" name="message" rows="5" required
                            class="w-full mt-1 border-gray-700 dark:border-gray-200 p-2 dark:bg-gray-900 dark:text-white focused"
                            ></textarea>
                </div>
                <div class="mt-3">
                    <button type="submit" id="submit"
                    class="dark:bg-gray-900 w-full dark:border-white border-gray-700 dark:border-gray-20 p-1 rounded-md border-2 border-solid">
                        <div id="loading" class="hidden">
                            <div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
                        </div>
                        <p id="sendText" class="text-gray-800 dark:text-white">Send</p>
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>


<style scoped>

.focused {
  border: solid;
  border-image-slice: 1;
  border-width: 2px;
  border-radius: 7px;
}

.focused:focus {
    border-radius: 7px;
    border-width: 5px;
    border-image-source: linear-gradient(-90deg, #00C853, #22fff8);
    animation: 1s infinite alternate border-gradient;
}
@keyframes border-gradient {
  0% {
    border-image-source: linear-gradient(-90deg, #00C853, #22fff8);
  }
  100% {
    border-image-source: linear-gradient(90deg, #00C853, #22fff8);
  }
}

.submited {
	background-size: 400% 400%;
    background-image: linear-gradient(-60deg, #01ff6b, #22fff8);
    animation: 3s infinite alternate bg-gradient;
    color: rgb(56, 56, 56);
    font-weight: 600;
}
@keyframes bg-gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}

.lds-ellipsis {
  display: inline-block;
  position: relative;
  width: 73px;
  height: 40px;
}
.lds-ellipsis div {
  position: absolute;
  top: 15px;
  width: 13px;
  height: 13px;
  border-radius: 50%;
  background: #000000;
  animation-timing-function: cubic-bezier(0, 1, 1, 0);
}
:is(.dark .lds-ellipsis div) {
  background: white;
}
.lds-ellipsis div:nth-child(1) {
  left: 8px;
  animation: lds-ellipsis1 0.6s infinite;
}
.lds-ellipsis div:nth-child(2) {
  left: 8px;
  animation: lds-ellipsis2 0.6s infinite;
}
.lds-ellipsis div:nth-child(3) {
  left: 32px;
  animation: lds-ellipsis2 0.6s infinite;
}
.lds-ellipsis div:nth-child(4) {
  left: 56px;
  animation: lds-ellipsis3 0.6s infinite;
}
@keyframes lds-ellipsis1 {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes lds-ellipsis3 {
  0% {
    transform: scale(1);
  }
  100% {
    transform: scale(0);
  }
}
@keyframes lds-ellipsis2 {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(24px, 0);
  }
}


</style>
