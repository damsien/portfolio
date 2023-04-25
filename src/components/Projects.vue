<script setup lang="ts">
  defineProps<{
    msg: string
  }>()
</script>

<template>
  <div>
    <div id="main-bg" class="dark:bg-gray-900 bg-gray-200 projects dark:text-white text-black">

      <p class="lg:text-9xl text-7xl font-bold text-center -top-20 z-10 text-white dark:text-black">Projects</p>

      <div class="sm:grid sm:grid-cols-2 top-44 flex flex-col-reverse">

        <!-- Pixel War -->
        <div class="w-full">
          <div class="mx-auto w-80 lg:w-96 mb-8">
            <p class="text-left text-lg font-semibold">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec lacus ac mi sollicitudin tristique quis sed enim. Quisque sodales purus scelerisque ante condimentum.
            </p>
            <br>

            <div class="grid grid-cols-2">
              <div class="w-full">
                <img src="../assets/web.png" width="15px" class="inline-block extern-icon">
                <a href="https://place.inpt.fr" target="_blank"> Open the game</a>
              </div>

              <div>
                <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
                <a href="https://github.com/Yltaros/rplace-frontend" target="_blank"> Frontend repository</a><br>

                <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
                <a href="https://github.com/Yltaros/rplace-backend" target="_blank"> Backend repository</a><br>

                <img src="../assets/github.png" width="15px" class="inline-block extern-icon">
                <a href="https://github.com/Yltaros/rplace-infra" target="_blank"> Infra repository</a><br>
              </div>
            </div>
          </div>
          <table class="items-group">
            <tr>
              <td class="item"><img src="../assets/icons/typescript.png"></td>
              <td class="item"><img src="../assets/icons/vue.png" class="pt-1"></td>
              <td class="item"><img src="../assets/icons/mariadb.svg" class="pt-2"></td>
            </tr>
            <tr>
              <td class="item"><img src="../assets/icons/nestjs.svg"></td>
              <td class="item"><img src="../assets/icons/vite.png"></td>
              <td class="item"><img src="../assets/icons/redis.svg" class="pt-1"></td>
            </tr>
          </table>
        </div>
        <div class="w-full sm:-top-14 mb-12">
          <p class="text-5xl font-semibold text-center -top-14 sm:top-0">Pixel War</p>
          <img src="../assets/projects/pixelwar.png" class="mx-auto mt-4">
        </div>




      </div>

    </div>
  </div>
</template>

<style scoped>

.item {
  width: 70px;
  height: 70px;
  border-radius: 100px;
  padding: 12px;
  margin: 10px;
  display: inline-block;
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
  background-image: linear-gradient(50deg, #ffffff, #e4e0ff);
  box-shadow: 0px 0px 100px 10px #cec5ff;
  animation: 5s infinite alternate light-groups-shadow;
}
@keyframes light-groups-shadow {
  0% {
    box-shadow: 0px 0px 100px 10px #cec5ff;
  }
  100% {
    box-shadow: 0px 0px 80px 20px #cec5ff;
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

:is(.dark .extern-icon) {
  filter: invert();
}


</style>
