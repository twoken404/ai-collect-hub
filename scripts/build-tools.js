import fs from 'fs'
import path from 'path'
import matter from 'gray-matter'

const contentDir = path.resolve(process.cwd(), 'content/tools')
const outputFile = path.resolve(process.cwd(), 'src/data/tools.json')

if (!fs.existsSync(path.dirname(outputFile))) {
  fs.mkdirSync(path.dirname(outputFile), { recursive: true })
}

const files = fs.readdirSync(contentDir).filter(file => file.endsWith('.md'))
const tools = files.map(file => {
  const filePath = path.join(contentDir, file)
  const content = fs.readFileSync(filePath, 'utf-8')
  const { data } = matter(content)
  return { id: file.replace('.md', ''), ...data }
})

fs.writeFileSync(outputFile, JSON.stringify(tools, null, 2))
console.log(`✅ 已生成 tools.json，包含 ${tools.length} 个工具`)
