<script setup lang="ts">
  defineProps<{
    msg: string
  }>()
</script>

<template>
  
  <div class="grid sm:grid-cols-2 bg-blue-500">
    <div class="w-full bg-red-500 top-48 h-72">
      <div class="sm:float-right text-left ps-8 sm:ps-0">
        <p class="lg:text-9xl text-7xl font-semibold">Welcome</p>
        <p class="lg:text-5xl text-3xl font-semibold">to my portofolio</p>
        <br><br>
        <p class="lg:text-3xl text-xl font-bold">Damien Dassieu</p>
      </div>
    </div>
    <div class="w-full bg-purple-400">
      
    </div>
  </div>
</template>

<style scoped>

</style>
