<template>
  <div class="min-h-screen bg-gray-100">
    <!-- 顶部导航 -->
    <header class="bg-white border-b border-gray-200 sticky top-0 z-10">
      <div class="max-w-6xl mx-auto px-4 h-14 flex items-center justify-between">
        <div class="flex items-center gap-6">
          <a href="#" class="text-xl font-bold text-orange-500">AI Hub</a>
          <input
            v-model="searchQuery"
            type="text"
            placeholder="搜索工具..."
            class="w-80 px-3 py-1.5 text-sm bg-gray-100 border border-gray-200 rounded-md 
                   focus:outline-none focus:border-orange-300 focus:bg-white max-w-full"
          />
        </div>
      </div>
    </header>

    <!-- 主内容 -->
    <main class="max-w-6xl mx-auto px-4 py-6">
      <!-- 标题区 -->
      <div class="flex items-center justify-between mb-6">
        <h1 class="text-2xl font-normal text-gray-900">精选免费、免注册、打开即用的 AI 工具，帮你快速解决问题，无需任何门槛。</h1>
        <span class="text-sm text-gray-500">{{ filteredTools.length }} 个收录</span>
      </div>

      <!-- 标签筛选 -->
      <div class="flex flex-wrap gap-2 mb-6">
        <button
          @click="selectedTag = null"
          :class="selectedTag === null ? 'bg-orange-500 text-white' : 'bg-white text-gray-700 border border-gray-300'"
          class="px-3 py-1 text-sm rounded-md transition-colors"
        >
          全部
        </button>
        <button
          v-for="tag in allTags"
          :key="tag"
          @click="selectedTag = tag"
          :class="selectedTag === tag ? 'bg-orange-500 text-white' : 'bg-white text-gray-700 border border-gray-300'"
          class="px-3 py-1 text-sm rounded-md transition-colors"
        >
          {{ tag }}
        </button>
      </div>

      <!-- 工具网格 - PC每行3个，手机1个 -->
      <div v-if="filteredTools.length > 0" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        <ToolCard v-for="tool in filteredTools" :key="tool.id" :tool="tool" />
      </div>
      
      <!-- 空状态 -->
      <div v-else class="p-8 text-center text-gray-500 bg-white rounded-md border border-gray-200">
        未找到匹配的工具
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import toolsData from './data/tools.json'
import ToolCard from './components/ToolCard.vue'

const selectedTag = ref(null)
const searchQuery = ref('')

const allTags = computed(() => {
  const tagSet = new Set()
  toolsData.forEach(tool => tool.tags?.forEach(tag => tagSet.add(tag)))
  return Array.from(tagSet).sort()
})

const filteredTools = computed(() => {
  let tools = toolsData
  if (selectedTag.value) {
    tools = tools.filter(tool => tool.tags?.includes(selectedTag.value))
  }
  if (searchQuery.value.trim()) {
    const q = searchQuery.value.toLowerCase()
    tools = tools.filter(tool => 
      tool.title.toLowerCase().includes(q) ||
      tool.description.toLowerCase().includes(q)
    )
  }
  return tools
})
</script>
