<script setup lang="ts">
    import $ from 'jquery'

    window.addEventListener('scroll', function() {
        if (window.scrollY > 60) {
            $('#navbar').addClass('dark:bg-slate-800/70 bg-slate-50/70');
        } else {
            $('#navbar').removeClass('dark:bg-slate-800/70 bg-slate-50/70');
        }
    });
</script>

<template>

    <nav id="navbar" class="dark:dark-transparent-navbar light-transparent-navbar border-solid dark:border-b-slate-400 border-b-slate-500"
        style="border-bottom-width: 0.5px;">

        <div class="flex sm:ps-2 ps-8">
            <div class="sm:mx-1 mx-0 my-1 sm:px-3px-1 py-2">
                <a href="#" class="button-nav
                    dark:text-slate-300 dark:hover:text-slate-200
                    text-slate-600 hover:text-slate-800
                    sm:text-lg text-sm font-medium">Introduction</a>
                <div class="dot"></div>
            </div>
            
            <div class="sm:mx-1 mx-0 my-1 sm:px-3 px-1 py-2">
                <a href="#" class="button-nav
                    dark:text-slate-300 dark:hover:text-slate-200
                    text-slate-600 hover:text-slate-800
                    sm:text-lg text-sm font-medium">Projects</a>
                <div class="dot"></div>
            </div>
            
            <div class="sm:mx-1 mx-0 my-1 sm:px-3 px-1 py-2">
                <a href="#" class="button-nav
                    dark:text-slate-300 dark:hover:text-slate-200
                    text-slate-600 hover:text-slate-800
                    sm:text-lg text-sm font-medium">Experience</a>
                <div class="dot"></div>
            </div>

            <div class="flex-auto fixed right-0 sm:mx-1 mx-0 my-1 sm:px-3 px-1 py-2">
                <a id="contact-btn" href="#" class="button-nav
                    text-white py-1 px-2 rounded-md
                    sm:text-lg text-sm font-semibold">Contact me</a>
            </div>
        </div>
        
        <div id="logo">
            <img src="../assets/logo.svg"/>
        </div>

    </nav>

</template>

<style scoped>

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
    box-shadow: 0px 0px 50px rgb(0, 255, 170);
  }
  100% {
    box-shadow: 0px 0px 10px rgb(55, 228, 200);
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

</style>