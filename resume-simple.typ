// ============================================================
// resume.typ — 单文件简历，所有参数都在顶部自己调
// 编译: typst compile resume.typ resume.pdf
// ============================================================

// ╔══════════════════════════════════════════════════════════╗
// ║          所有可调参数（改下面数字就行）                  ║
// ╚══════════════════════════════════════════════════════════╝

// 主色调（标题、姓名的颜色）
#let accent       = rgb("#1a5276")

// 字体列表（按优先级，系统有哪个用哪个）
#let font-main    = ("Noto Sans SC", "Microsoft YaHei", "SimHei")

// 字号
#let size-name    = 20pt    // 姓名
#let size-section = 11pt    // 板块标题
#let size-body    = 9pt     // 正文

// 页边距（越小越紧凑）
#let margin-top    = 0.8cm
#let margin-bottom = 0.6cm
#let margin-left   = 1.0cm
#let margin-right  = 1.0cm

// 间距（越小越紧凑，越大越松散）
#let gap-section  = 5pt     // 板块之间的间距
#let gap-entry    = 4pt     // 条目之间的间距
#let gap-bullet   = 0.5pt   // 要点之间的间距
#let line-height  = 0.55em  // 行距（中文 0.55-0.7，越小越紧凑）

// ╔══════════════════════════════════════════════════════════╗
// ║          全局设定（不用动）                              ║
// ╚══════════════════════════════════════════════════════════╝

#set page(paper: "a4", margin: (top: margin-top, bottom: margin-bottom, left: margin-left, right: margin-right))
#set text(font: font-main, size: size-body, lang: "zh")
#set par(leading: line-height, justify: true)

// ╔══════════════════════════════════════════════════════════╗
// ║          组件（不用动）                                  ║
// ╚══════════════════════════════════════════════════════════╝

// 板块标题：左边有个色条
#let section(title) = {
  v(gap-section, weak: true)
  block(
    stroke: (left: 2.5pt + accent, right: 0pt, top: 0pt, bottom: 0pt),
    inset: (left: 8pt, top: 1pt, bottom: 2pt),
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
    text(size: size-body - 0.5pt, fill: rgb("#64748b"))[#date],
  )
  v(1pt)
  body
}

// 要点
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// 技能分类
#let skill-group(category, items) = {
  text(weight: "bold", fill: accent)[#category：]
  items.join("、")
  v(2pt)
}

// 项目
#let project(name, url, body) = {
  v(3pt)
  text(weight: "bold", size: size-body + 0.5pt)[#name]
  text(size: size-body - 1pt, fill: rgb("#64748b"))[ | #url]
  v(1pt)
  body
}

// 获奖：年份 | 奖项名 | 颁发方
#let award(year, name, issuer) = {
  v(1.5pt)
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 8pt,
    text(size: size-body - 0.5pt, fill: rgb("#64748b"))[#year],
    text(weight: "bold")[#name],
    text(size: size-body - 1pt, fill: rgb("#64748b"))[#issuer],
  )
}

// ╔══════════════════════════════════════════════════════════╗
// ║          简历内容（填你自己的信息）                      ║
// ╚══════════════════════════════════════════════════════════╝

// ———— 个人信息 ————
#align(center)[
  #text(size: size-name, weight: "bold", fill: accent)[张明远]
  #v(2pt)
  #text(size: size-body - 0.5pt, fill: rgb("#64748b"))[
    138-0000-0000 · zhangmingyuan\@email.com · github.com/zhangmingyuan · 北京市
  ]
  #v(1pt)
  #text(size: size-body, fill: rgb("#64748b"))[高级软件工程师 / 全栈开发]
]

// ———— 教育经历 ————
#section[教育经历]

#entry("清华大学", "计算机科学与技术 · 硕士", "2014 – 2016")[
  #bullet[研究方向：分布式系统与云计算。发表论文《基于预测模型的边缘计算任务调度优化算法》，INFOCOM 2016 最佳论文候选。]
]

#entry("华中科技大学", "软件工程 · 学士", "2010 – 2014")[
  #bullet[GPA: 3.9 / 4.0 | 国家奖学金（2012、2013）| 校优秀毕业生 | ACM-ICPC 亚洲区域赛银奖]
]

// ———— 获奖经历 ————
#section[获奖经历]

#award("2023", "字节跳动年度技术突破奖", "字节跳动")
#award("2020", "淘系技术部最佳新人奖", "阿里巴巴")
#award("2019", "Apache 顶级项目 Committer", "Apache 软件基金会")
#award("2013", "ACM-ICPC 亚洲区域赛银奖", "ACM")

// ———— 专业技能 ————
#section[专业技能]

#skill-group("语言", ("Java", "Go", "Python", "TypeScript", "Rust", "SQL"))
#skill-group("框架", ("Spring Boot", "Kafka", "Redis", "Flink", "React", "Node.js"))
#skill-group("基础设施", ("Docker", "Kubernetes", "AWS", "Terraform", "MySQL", "TiDB"))
#skill-group("工具", ("Git", "CI/CD", "微服务治理", "性能调优", "系统设计"))

// ———— 工作经历 ————
#section[工作经历]

#entry("字节跳动 · 抖音事业部", "高级后端工程师", "2022.01 – 至今")[
  #bullet[负责抖音直播营收系统的微服务架构设计与性能优化，支撑日均 500 万+ 付费用户的高并发交易场景。]
  #bullet[主导数据库读写分离与缓存层重构，将核心交易链路 P99 延迟从 380ms 降低至 85ms，可用性提升至 99.99%。]
  #bullet[带领 6 人后端团队，建立 Code Review 规范与线上事故分级响应机制，团队人效提升 40%。]
]

#entry("阿里巴巴 · 淘系技术部", "Java 开发工程师", "2019.03 – 2021.12")[
  #bullet[参与淘宝商品详情页架构升级，设计并实现基于 Flink 的实时商品特征计算管道，日处理数据量级超 10TB。]
  #bullet[开发商品推荐引擎的 AB 实验平台，支持灰度发布与实时效果验证，将实验迭代周期从周级压缩至天级。]
]

#entry("美团 · 到店事业群", "初级后端工程师", "2016.07 – 2019.02")[
  #bullet[参与美团到店餐饮预订系统的开发与维护，使用 Java/Spring Boot 技术栈，服务日均 200 万+ 订单。]
  #bullet[独立负责订单超时自动取消模块的从零到一实现，包括设计、开发、测试与上线全流程。]
]

// ———— 项目经历 ————
#section[项目经历]

#project("XAnalyzer — 开源 Java 性能分析工具", "github.com/zhangmingyuan/xanalyzer")[
  #bullet[基于字节码插桩的 Java 应用性能分析 CLI 工具，支持热点方法检测、内存分配追踪与线程死锁诊断。GitHub 3.2k Stars。]
]

#project("QuickDeploy — 轻量级 CI/CD 平台", "quickdeploy.dev")[
  #bullet[基于 Go + Vue.js 构建的轻量级持续部署平台，支持 Docker 单机与 Kubernetes 集群两种模式。SaaS 月活团队 300+。]
]
