// ============================================================
// resume-opt.typ — 优化版简历，静态中文字体 + 照片头像布局
// 编译: typst compile resume-opt.typ resume-opt.pdf
// ============================================================

// ╔══════════════════════════════════════════════════════════╗
// ║          所有可调参数（改下面数字就行）                  ║
// ╚══════════════════════════════════════════════════════════╝

// 主色调（标题、姓名的颜色）
#let accent       = rgb("#000000")

// 字体列表（仅使用静态中文字体，避免 variable font 警告）
#let font-main    = ("Microsoft YaHei", "SimHei")

// 字号
#let size-name    = 18pt    // 姓名
#let size-section = 11pt    // 板块标题
#let size-body    = 9pt     // 正文

// 页边距（越小越紧凑）
#let margin-top    = 0.8cm
#let margin-bottom = 0.6cm
#let margin-left   = 1cm
#let margin-right  = 1cm

// 间距（越小越紧凑，越大越松散）
#let gap-section  = 6pt      // 板块之间的间距
#let gap-entry    = 4pt      // 条目之间的间距
#let gap-bullet   = 0.5pt    // 要点之间的间距
#let line-height  = 0.55em   // 行距

// ╔══════════════════════════════════════════════════════════╗
// ║          全局设定（不用动）                              ║
// ╚══════════════════════════════════════════════════════════╝

#set page(paper: "a4", margin: (top: margin-top, bottom: margin-bottom, left: margin-left, right: margin-right))
#set text(font: font-main, size: size-body, lang: "zh")
#set par(leading: line-height, justify: true)

// ╔══════════════════════════════════════════════════════════╗
// ║          组件（不用动）                                  ║
// ╚══════════════════════════════════════════════════════════╝

// 板块标题：左边色条 + 底部细线
#let section(title) = {
  v(gap-section, weak: true)
  block(
    stroke: (left: 2.5pt + accent, right: 0pt, top: 0pt, bottom: 0.5pt + rgb("#cccccc")),
    inset: (left: 8pt, top: 1pt, bottom: 3pt, right: 0pt),
    outset: (bottom: 3pt),
  )[#text(size: size-section, weight: "bold", fill: accent)[#title]]
}

// 条目：一行显示 公司 · 职位  |  日期
#let entry(title, subtitle, date, body) = {
  v(gap-entry, weak: true)
  grid(
    columns: (1fr, auto),
    column-gutter: 6pt,
    text(weight: "bold", size: size-body + 0.5pt)[#title · #subtitle],
    text(size: size-body - 0.5pt, fill: rgb("#000000"))[#date],
  )
  v(gap-entry, weak: true)
  body
}

// 要点
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// 技能分类
#let skill-group(category, items) = {
  text(weight: "bold", fill: accent)[#category： ]
  items.join("   ")
  v(0pt)
}

// 项目
#let project(name, url, body) = {
  v(1pt)
  text(weight: "bold", size: size-body + 0.5pt)[#name]
  text(size: size-body - 1pt, fill: rgb("#000000"))[ | #url]
  v(1pt)
  body
}

// 获奖：年份 | 奖项名 | 颁发方
#let award(year, name, issuer) = {
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 8pt,
    text(size: size-body - 0.5pt, fill: rgb("#000000"))[#year],
    text(weight: "bold")[#name],
    text(size: size-body - 1pt, fill: rgb("#000000"))[#issuer],
  )
}

// ╔══════════════════════════════════════════════════════════╗
// ║          简历内容（填你自己的信息）                      ║
// ╚══════════════════════════════════════════════════════════╝

// ———— 个人信息（照片 + 联系方式）————
#block(outset: (bottom: 6pt))[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 14pt,
    // 左侧照片（替换为你的照片文件路径）
    rect(width: 2.8cm, height: 3.7cm, fill: rgb("#e0e0e0"))[
      #align(center + horizon, text(fill: rgb("#999999"), size: 10pt)[照片])
    ],
    // 右侧信息
    [
      #text(size: size-name, weight: "bold", fill: accent)[周康禧]
      #v(3pt)
      #text(size: size-body + 1pt)[C++量化开发实习生]
      #v(5pt)
      #grid(
        columns: (auto, 1fr),
        column-gutter: 8pt,
        row-gutter: 2pt,
        text(fill: rgb("#555555"))[电话], [15071352747],
        text(fill: rgb("#555555"))[邮箱], [2067545015\@qq.com],
        text(fill: rgb("#555555"))[GitHub], [github.com/yjwyyds1],
        text(fill: rgb("#555555"))[地址], [武汉市],
      )
    ],
  )
]

// ———— 教育经历 ————
#section[教育经历]

#entry("黄冈师范学院", "大数据科学与大数据技术 · 本科", "2023 – 2027")[
  #bullet[主修课程：数据结构与算法、数据库技术、Linux操作系统基础、统计学等]
]

// ———— 获奖经历 ————
#section[获奖经历]
#award("2025/11", "「华为杯」第50届ACM-ICPC国际大学生程序设计竞赛区域赛武汉站", "区域赛铜奖")
#award("2025/06", "CCPC中国大学生程序设计竞赛-全国邀请赛（郑州）", "邀请赛银奖")
#award("2026/05", "2026年ACM-ICPC国际大学生程序设计竞赛全国邀请赛（武汉）暨湖北省赛", "邀请赛银奖/省赛银奖")
#award("2026/06", "第十七届蓝桥杯全国软件和信息技术专业人才大赛C/C++程序设计", "国赛二等奖")
#award("2026/05", "第十七届蓝桥杯全国软件和信息技术专业人才大赛Python程序设计", "省赛一等奖")

// ———— 专业技能 ————
#section[专业技能]

#skill-group("语言", ("C/C++", "Python", "SQL"))
#skill-group("框架", ("Spring Boot", "Kafka", "Redis", "Flink", "React", "Node.js"))
#skill-group("基础设施", ("Docker", "Kubernetes", "AWS", "Terraform", "MySQL", "TiDB"))
#skill-group("工具", ("Git", "CI/CD", "微服务治理", "性能调优", "系统设计"))

// ———— 工作经历 ————
#section[实习经历]

#entry("南京量化 · 数据分析与算法研发部","C++开发实习生", "2026.04 – 至今")[
  #bullet[负责抖音直播营收系统的微服务架构设计与性能优化，支撑日均 500 万+ 付费用户的高并发交易场景。]
  #bullet[主导数据库读写分离与缓存层重构，将核心交易链路 P99 延迟从 380ms 降低至 85ms，可用性提升至 99.99%。]
  #bullet[带领 6 人后端团队，建立 Code Review 规范与线上事故分级响应机制，团队人效提升 40%。]
]

// ———— 项目经历 ————
#section[项目经历]

#project("XAnalyzer — 开源 Java 性能分析工具", "github.com/zhangmingyuan/xanalyzer")[
  #bullet[基于字节码插桩的 Java 应用性能分析 CLI 工具，支持热点方法检测、内存分配追踪与线程死锁诊断。GitHub 3.2k Stars。]
]

#project("QuickDeploy — 轻量级 CI/CD 平台", "quickdeploy.dev")[
  #bullet[基于 Go + Vue.js 构建的轻量级持续部署平台，支持 Docker 单机与 Kubernetes 集群两种模式。SaaS 月活团队 300+。]
]
