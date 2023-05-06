<script setup lang="ts">



</script>


<template>
    <div>
        <div class="dark:bg-gray-900 bg-gray-200 dark:text-white text-black w-full">

            <div id="title" class="lg:h-80 h-64 pt-20 overflow-hidden">
                <div class="w-fit mx-auto z-10">
                    <p class="lg:text-9xl text-7xl font-bold text-gray-800 dark:text-white">Experience</p>
                    <div id="exp-title-bar" class="mt-7 bg-gray-800 dark:bg-white h-2"></div>
                </div>
                <div id="bubbles">
                    <div id="bubble1" class="bubble"></div>
                    <div id="bubble2" class="bubble"></div>
                    <div id="bubble3" class="bubble"></div>
                </div>
            </div>


            <div id="main-parallax">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lacinia varius risus, at aliquam libero rhoncus sit amet. Quisque non urna nec diam ultricies elementum. Fusce auctor ligula eget lobortis iaculis. Proin sit amet aliquet tellus, ut interdum nibh. Vestibulum enim leo, euismod id nisi et, laoreet fermentum leo. Aenean eros magna, consequat ac erat pellentesque, interdum tempus lacus. Suspendisse condimentum felis non arcu accumsan commodo. Morbi fringilla lectus tortor, vitae eleifend neque rhoncus eu.

Proin mollis, nisl vitae pulvinar porttitor, ex nulla faucibus magna, ut pulvinar odio ipsum vel turpis. Nullam pellentesque a turpis et fringilla. Duis mattis elementum augue, suscipit commodo urna bibendum eu. Pellentesque iaculis nisi at volutpat dignissim. Nunc ultricies dictum magna, non elementum nunc scelerisque non. Donec imperdiet tellus ac odio auctor, ut tempus justo sollicitudin. Curabitur nec ex sit amet est dapibus sodales. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sagittis felis at rhoncus rhoncus. Sed sodales, sem ac suscipit interdum, lacus dolor condimentum libero, et efficitur urna diam sed nunc. Nunc dignissim euismod ex, eget aliquam elit. Sed blandit cursus tellus, vel scelerisque neque aliquet sit amet. Nam scelerisque luctus sem, id mattis quam elementum aliquam.



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


.bubble {
    position: absolute;
    filter: blur(200px);
    border-radius: 50%;
    width: 700px;
    height: 700px;
}

#bubble1 {
    background-color: rgba(248, 97, 195, 0.956);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble1;
}
@keyframes bubble1 {
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
#bubble2 {
    background-color: rgba(0, 224, 71, 0.749);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble2;
}
@keyframes bubble2 {
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
#bubble3 {
    background-color: rgba(66, 107, 255, 0.944);
    animation: 5s infinite alternate cubic-bezier(.65,.29,.27,.9) bubble3;
}
@keyframes bubble3 {
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