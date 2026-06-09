# 简历生成器

基于 [Typst](https://typst.dev) 的简约风格简历 PDF 生成器。所有样式（颜色、字体、间距）集中在一个配置文件里修改，无需碰布局代码。

## 快速开始

```powershell
# 1. 安装 Typst（如果还没装）
winget install Typst.Typst

# 2. 从模板复制一份，填入你的个人信息
cp resume.example.typ resume.typ

# 3. 编译生成 PDF
.\compile.ps1
```

实时预览模式（保存即自动刷新 PDF）：

```powershell
.\compile.ps1 -Watch
```

## 项目结构

```
├── theme.typ           # 所有样式参数（颜色、字体、间距、布局）
├── resume.example.typ  # 模板文件，含占位内容（可安全上传 GitHub）
├── resume.typ          # 你的真实简历（已加入 .gitignore，不会上传）
├── compile.ps1         # 一键编译 / 监听脚本
└── resume.pdf          # 生成的 PDF（已加入 .gitignore）
```

## 自定义样式

打开 `theme.typ`，修改以下任意参数即可：

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

## VSCode 插件

推荐安装以下两个扩展获得最佳编辑体验：

- **[Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)** — 语法高亮、自动补全、错误诊断
- **[Typst Preview](https://marketplace.visualstudio.com/items?itemName=mgt19937.typst-preview)** — 侧边栏实时预览 PDF（可选，但强烈推荐）

装上 Typst LSP 后打开任意 `.typ` 文件即可获得完整 IDE 支持。

## 隐私说明

`resume.typ` 和 `resume.pdf` 已加入 `.gitignore`，仅模板文件 `resume.example.typ` 和样式文件会被 Git 跟踪。你的个人信息不会出现在 GitHub 上。

其他人 clone 本项目后，只需 `cp resume.example.typ resume.typ` 然后填入自己的信息即可使用。

## 许可证

MIT — 随意使用。
