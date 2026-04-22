<template>
  <a :href="tool.url" target="_blank" rel="noopener noreferrer"
     class="block bg-white rounded-md border border-gray-200 p-4 hover:border-orange-300 hover:shadow-sm transition-all">
    
    <div class="flex items-start gap-3">
      <!-- 图标 -->
      <div class="flex-shrink-0 w-10 h-10 flex items-center justify-center bg-gray-100 rounded-md overflow-hidden">
        <span class="text-xl">{{ tool.icon || '🔧' }}</span>
      </div>

      <!-- 内容 -->
      <div class="flex-1 min-w-0">
        <h3 class="text-sm font-medium text-orange-600 hover:text-orange-700 truncate">
          {{ tool.title }}
        </h3>
        <p class="text-xs text-gray-500 mt-1 line-clamp-2">{{ tool.description }}</p>
        <div class="flex flex-wrap gap-1.5 mt-2">
          <span v-for="tag in tool.tags" :key="tag" 
                class="inline-flex items-center px-2 py-0.5 text-xs rounded bg-orange-100 text-orange-700">
            {{ tag }}
          </span>
        </div>
      </div>
    </div>
  </a>
</template>

<script setup>
defineProps(['tool'])
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style>
