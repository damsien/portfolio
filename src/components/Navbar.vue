<script setup lang="ts">
import { onMounted } from 'vue';


    window.addEventListener('scroll', function() {
        if (window.scrollY > 60) {
            document.getElementById('navbar')?.classList.add('dark:bg-slate-800/70 bg-slate-50/70');
        } else {
            document.getElementById('navbar')?.classList.remove('dark:bg-slate-800/70 bg-slate-50/70');
        }
    });

    onMounted(() => {

        if (document.documentElement.classList.contains('dark')) {
            document.getElementById('moon')?.classList.add('opacity-0');
            document.getElementById('sun')?.classList.add('opacity-100');
            //@ts-ignore
            document.getElementById('sun').style.filter = 'invert()';
        } else {
            document.getElementById('moon')?.classList.add('opacity-100');
            document.getElementById('sun')?.classList.add('opacity-0');
        }

    })

    //@ts-ignore
    function toggle(e) {
        if (document.documentElement.classList.contains('dark')) {
            //@ts-ignore
            document.getElementById('sun').style.transform = 'rotate(360deg)'
            document.getElementById('sun')?.classList.remove('opacity-100');
            document.getElementById('sun')?.classList.add('opacity-50');
            //@ts-ignore
            document.getElementById('sun').style.filter = 'none';
            document.getElementById('sun')?.classList.remove('opacity-50');
            document.getElementById('sun')?.classList.add('opacity-0');
            //@ts-ignore
            document.getElementById('sun').style.transform = 'rotate(0deg)'

            document.getElementById('moon')?.classList.remove('opacity-0');
            document.getElementById('moon')?.classList.add('opacity-50');
            //@ts-ignore
            document.getElementById('moon').style.filter = 'none';
            document.getElementById('moon')?.classList.remove('opacity-50');
            document.getElementById('moon')?.classList.add('opacity-100');
            //@ts-ignore
            document.getElementById('moon').style.transform = 'rotate(360deg)'
            //@ts-ignore
            document.getElementById('moon').style.transform = 'rotate(0deg)'

            document.documentElement.classList.remove('dark');
        } else {
            //@ts-ignore
            document.getElementById('moon').style.transform = 'rotate(180deg)'
            document.getElementById('moon')?.classList.remove('opacity-100');
            document.getElementById('moon')?.classList.add('opacity-50');
            //@ts-ignore
            document.getElementById('moon').style.filter = 'invert()';
            document.getElementById('moon')?.classList.remove('opacity-50');
            document.getElementById('moon')?.classList.add('opacity-0');

            document.getElementById('sun')?.classList.remove('opacity-0');
            document.getElementById('sun')?.classList.add('opacity-50');
            //@ts-ignore
            document.getElementById('sun').style.filter = 'invert()';
            document.getElementById('sun')?.classList.remove('opacity-50');
            document.getElementById('sun')?.classList.add('opacity-100');
            //@ts-ignore
            document.getElementById('sun').style.transform = 'rotate(180deg)'

            document.documentElement.classList.add('dark');
        }
    }

</script>

<template>

    <nav id="navbar" class="dark:dark-transparent-navbar light-transparent-navbar border-solid dark:border-b-slate-400 border-b-slate-500"
        style="border-bottom-width: 0.5px;">

        <div class="flex sm:ps-2 ps-8">
            <div class="sm:mx-1 mx-0 my-1 sm:px-3px-1 py-2 hidden sm:block">
                <a href="#welcome" class="button-nav
                    dark:text-slate-300 dark:hover:text-slate-200
                    text-slate-600 hover:text-slate-800
                    sm:text-lg text-sm 4xl:text-xl 5xl:text-2xl 6xl:text-3xl font-medium">Introduction</a>
                <div class="dot"></div>
            </div>
            
            <div class="sm:mx-1 mx-0 my-1 sm:px-3 px-1 py-2">
                <a href="#projects" class="button-nav
                    dark:text-slate-300 dark:hover:text-slate-200
                    text-slate-600 hover:text-slate-800
                    sm:text-lg text-sm 4xl:text-xl 5xl:text-2xl 6xl:text-3xl font-medium">Projects</a>
                <div class="dot"></div>
            </div>
            
            <div class="sm:mx-1 mx-0 my-1 sm:px-3 px-1 py-2">
                <a href="#experience" class="button-nav
                    dark:text-slate-300 dark:hover:text-slate-200
                    text-slate-600 hover:text-slate-800
                    sm:text-lg text-sm 4xl:text-xl 5xl:text-2xl 6xl:text-3xl font-medium">Experience</a>
                <div class="dot"></div>
            </div>

            <div id="toggle" class="flex-auto fixed right-0 mt-2.5 sm:mt-3 me-28 sm:me-36 3xl:me-44 6xl:me-52">
                <button @click="toggle">
                    <img id="moon" class="dark-toggle absolute" src="@/assets/icons/moon1.svg" />
                    <img id="sun" class="dark-toggle relative" src="@/assets/icons/sun1.svg" />
                </button>
            </div>

            <div class="flex-auto fixed right-0 sm:mx-1 mx-0 my-1 sm:px-3 px-1 py-2">
                <a id="contact-btn" href="#contact" class="button-nav
                    text-white py-1 px-2 rounded-md
                    sm:text-lg text-sm 4xl:text-xl 5xl:text-2xl 6xl:text-3xl font-semibold">Contact me</a>
            </div>
        </div>
        
        <div id="logo">
            <a href="#welcome">
                <img src="@/assets/icons/logo.png"/>
            </a>
        </div>

    </nav>

</template>

<style scoped>

#moon {
    transform: rotate(180deg);
    width: 0.9rem;
    margin-top: 0.4rem;
    right: 3px;
}
#sun {
    transform: rotate(0deg);
    width: 1.2rem;
    margin-top: 0.3rem;
}
@media (min-width: 640px) {
    #moon {
        width: 1.3rem;
        margin-top: 0.2rem;
        right: 5px;
    }
    #sun {
        width: 1.8rem;
        margin-top: 0rem;
    }
}
@media (min-width: 1800px) {
    #moon {
        width: 1.8rem;
        margin-top: 0.5rem;
    }
    #sun {
        width: 2.5rem;
        margin-top: 0.2rem;
    }
}

.dark-toggle {
    transition-timing-function: cubic-bezier(.84,-0.01,.21,1) !important;
    transition-duration: 300ms !important;
}

#contact-btn {
    background-position: left 0% bottom 0%;
    background-size: 400%;
    background-image: linear-gradient(50deg, #2ecc71, #2ecc71, #2ecc71, #1abc9c, #1ed1ad, #21e3bc, #2ecc71, #2ecc71, #2ecc71);
    transition: 0.5s;
    animation: 2.5s infinite alternate contactshadow;
}
#contact-btn:hover {
    background-position: left 100% bottom 100%;
}

@keyframes contactshadow {
  0% {
    box-shadow: 0px 0px 10px rgb(0, 255, 170);
  }
  100% {
    box-shadow: 0px 0px 5px rgb(55, 228, 200);
  }
}

#logo {
    position: absolute;
    top: 50%;
    left: 17px;
    width: 15px;
    height: 15px;
    transform: translate(-50%, -50%);
}
@media (min-width: 640px) {
    #logo {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 20px;
            height: 20px;
            transform: translate(-50%, -50%);
    }
}
@media (min-width: 1700px) {
    #logo {
            width: 27px;
            height: 27px;
    }
}
@media (min-width: 2200px) {
    #logo {
            width: 35px;
            height: 35px;
    }
}

.light-transparent-navbar {
    background-color: rgba(255, 255, 255, 0.7);
}

:is(.dark .dark\:dark-transparent-navbar) {
    background-color: rgba(0, 0, 0, 0.527);
}

.dot {
    margin: auto;
    margin-top: -2px;
    display: block;
    width: 4px;
    height: 4px;
    border-radius: 50%;
}

.button-nav:hover + .dot {
    background-color: rgb(71 85 105 / var(--tw-bg-opacity));
    animation: dot 0.35s forwards;
}

@keyframes dot {
  0% {
    transform: scale(0);
  }
  100% {
    transform: scale(1);
  }
}


/*      DARK MODE       */

</style>