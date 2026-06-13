# 简历生成器

基于 [Typst](https://typst.dev) 的简约风格简历 PDF 生成器。支持中英文简历，所有样式（颜色、字体、间距）集中在一个配置文件里修改，无需碰布局代码。

## 快速开始

```powershell
# 1. 安装 Typst（如果还没装）
winget install Typst.Typst

# 2. 从模板复制一份，填入你的个人信息
cp resume.example.typ resume.typ            # 英文简历
# 中文 V2 简历可直接编辑 resume-zh-v2.typ（已含占位内容）

# 3. 编译生成 PDF
.\compile.ps1                               # 英文简历
.\compile.ps1 -Template resume-zh-v2.typ # 中文简历
```

实时预览模式（保存即自动刷新 PDF）：

```powershell
.\compile.ps1 -Watch
.\compile.ps1 -Template resume-zh-v2.typ -Watch
```

## 中文简历

中文简历模板 `resume-zh.typ` 包含 7 个板块：个人信息、个人简介、工作经历、项目经验、教育背景、获奖经历、专业技能。

### 六种视觉风格

通过修改对应 `resume-*.typ` 第一行 `#import` 切换主题：

| 主题文件 | 风格 | 配色 | 特点 |
|---|---|---|---|
| `theme-fresh.typ` | 青翠现代（默认🔰） | 青绿 Teal | 卡片式头部、左边框标题、紧凑布局 |
| `theme-indigo.typ` | 靛蓝优雅 | 靛蓝 Indigo | 柔和背景、细线标题、圆角卡片 |
| `theme-ocean.typ` | 深海蓝调 | 深蓝 Ocean | 带边框卡片、加粗色条标题、标签式技能 |
| `theme-modern.typ` | 现代极简 | 深蓝灰 | 单列简约、细线分割 |
| `theme-classic.typ` | 传统正式 | 暗红 | 衬线字体、双线头部分隔 |
| `theme-compact.typ` | 信息密集 | 科技蓝 | 左边框标题、双栏技能区 |

切换方法：修改对应 `.typ` 文件第一行，例如：

```typst
#import "theme-ocean.typ": *   // 切换到深海蓝调风格
```

注意：中文简历 V2（新板块顺序、新组件）使用 `resume-zh-v2.typ`，支持三种新主题。旧版 `resume-zh.typ` 仍可使用原先三种主题。

### 中文字体安装

推荐安装以下字体以获得最佳 PDF 效果：

- **[Source Han Sans CN](https://github.com/adobe-fonts/source-han-sans)**（思源黑体）— 现代极简/信息密集风格首选
- **[Source Han Serif CN](https://github.com/adobe-fonts/source-han-serif)**（思源宋体）— 传统正式风格首选

若未安装上述字体，模板会自动回退到系统自带字体（Microsoft YaHei / SimSun / SimHei）。

## 项目结构

```
├── theme.typ              # 英文主题（所有样式参数）
├── theme-modern.typ       # 中文 · 现代极简主题
├── theme-classic.typ      # 中文 · 传统正式主题
├── theme-compact.typ      # 中文 · 信息密集主题
├── resume.example.typ     # 英文简历模板
├── resume-zh.typ          # 中文简历内容（可直接编辑或复制后改）
├── compile.ps1            # 一键编译 / 监听脚本
└── resume.pdf             # 生成的 PDF（已加入 .gitignore）
```

## 自定义样式

打开对应的 theme 文件，修改以下任意参数即可：

| 参数              | 控制内容               |
|-------------------|------------------------|
| `accent`          | 标题和姓名的颜色       |
| `text-clr`        | 正文颜色               |
| `muted`           | 日期、副标题等次要文字 |
| `divider`         | 章节标题下方的分割线   |
| `font-main`       | 字体（数组，支持回退） |
| `size-base`       | 基础字号               |
| `size-name`       | 姓名栏字号             |
| `size-section`    | 章节标题字号           |
| `margin-page`     | 页边距（上/下/左/右）  |
| `gap-section`     | 章节标题前的间距       |
| `gap-entry`       | 条目之间的间距         |
| `gap-bullet`      | 列表项之间的间距       |
| `par-leading`     | 行距（中文推荐 0.65em–0.7em） |

如果内容超出一页，优先减小 `gap-section`、`gap-entry` 或 `size-base`。

## VSCode 插件

推荐安装以下两个扩展获得最佳编辑体验：

- **[Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)** — 语法高亮、自动补全、错误诊断
- **[Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview)** — 侧边栏实时预览 PDF（可选，但强烈推荐）

装上 Typst LSP 后打开任意 `.typ` 文件即可获得完整 IDE 支持。

## 隐私说明

`resume.typ`、`resume-zh.typ` 和 `resume.pdf` 已加入 `.gitignore`，仅模板文件和样式文件会被 Git 跟踪。你的个人信息不会出现在 GitHub 上。

## 许可证

MIT — 随意使用。
