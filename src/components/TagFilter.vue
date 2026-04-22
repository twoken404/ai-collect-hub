<template>
  <div class="mb-6">
    <div class="flex flex-wrap gap-2 justify-center">
      <!-- 全部按钮 -->
      <button
        @click="$emit('update:selected', null)"
        :class="[
          'px-3 py-1.5 rounded-full text-xs font-medium transition-all duration-200',
          selectedTag === null 
            ? 'bg-gradient-to-r from-primary-500 to-accent-500 text-white shadow-md shadow-primary-500/20'
            : 'bg-white/80 text-gray-600 border border-gray-200 hover:border-primary-300 hover:bg-white'
        ]"
      >
        全部
      </button>

      <!-- 标签按钮 -->
      <button
        v-for="tag in allTags"
        :key="tag"
        @click="$emit('update:selected', tag)"
        :class="[
          'px-3 py-1.5 rounded-full text-xs font-medium transition-all duration-200',
          selectedTag === tag
            ? 'bg-gradient-to-r from-primary-500 to-accent-500 text-white shadow-md shadow-primary-500/20'
            : 'bg-white/80 text-gray-600 border border-gray-200 hover:border-primary-300 hover:bg-white'
        ]"
      >
        {{ tag }}
      </button>
    </div>
  </div>
</template>

<script setup>
defineProps(['allTags', 'selectedTag'])
defineEmits(['update:selected'])
</script>
