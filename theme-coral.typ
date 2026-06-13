// ============================================================
// theme-coral.typ — 珊瑚科技 Coral Tech
// Warm coral accent with charcoal text. Modern startup/tech feel.
// ============================================================

// --- Colors ---
#let accent      = rgb("#e8614c")   // warm coral — headings, markers, emphasis
#let text-clr    = rgb("#2d2d2d")   // charcoal body text
#let muted       = rgb("#8c8c8c")   // dates, subtitles, secondary info
#let divider     = rgb("#e8d5d0")   // section underline, warm pale pink
#let bg-tint     = rgb("#fef8f6")   // subtle warm background tint

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 11pt

// --- Page layout ---
#let margin-page = (
  top:    1.1cm,
  bottom: 0.9cm,
  left:   1.3cm,
  right:  1.3cm,
)

// --- Spacing ---
#let gap-section = 7pt     // space before each section heading
#let gap-entry   = 4pt     // space between entries
#let gap-bullet  = 0.5pt   // space between bullet points

// --- Chinese typesetting ---
#let section-transform = it => it
#let par-leading        = 0.58em

// ============================================================
// GLOBAL PAGE SETUP
// ============================================================
#set page(paper: "a4", margin: margin-page)
#set text(font: font-main, size: size-base, fill: text-clr, lang: "zh")
#set par(leading: par-leading, justify: true)

// ============================================================
// REUSABLE COMPONENTS
// ============================================================

// Section heading — small coral diamond marker before bold title, thin warm line below
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent)[
    #box(baseline: 3pt, fill: accent, inset: 0pt, height: 4.5pt, width: 4.5pt, radius: 0.5pt)
    #h(5pt)
    #section-transform(title)
  ]
  v(3pt)
  line(length: 100%, stroke: 0.3pt + divider)
  v(5pt)
}

// Single entry — used for work experience, education, etc.
//   title    = company / school name (bold)
//   subtitle = role / degree (muted)
//   date     = date range (right-aligned, muted)
//   body     = description content (bullet points)
// ONE-LINE header: "title · subtitle" bold left, date muted right
#let entry(title, subtitle, date, body) = {
  v(gap-entry, weak: true)
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    text(weight: "bold", size: size-base + 0.5pt)[#title · #subtitle],
    text(size: size-base - 0.5pt, fill: muted)[#date],
  )
  v(1pt)
  body
}

// Bullet point — dash bullet
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// Skill category — "category：" in accent bold, items joined by "、"
#let skill-group(category, items) = {
  text(weight: "bold", fill: accent)[#category：]
  text(fill: text-clr)[#items.join("、")]
  v(2pt)
}

// Project entry — bold name + muted url, then body
#let project(name, url, body) = {
  v(3pt)
  text(weight: "bold", size: size-base + 0.5pt)[#name]
  text(size: size-base - 1pt, fill: muted)[ | #url]
  v(1pt)
  body
}

// Award entry — compact grid: year(auto) | name(1fr bold) | issuer(auto muted)
#let award(year, name, issuer) = {
  v(1.5pt)
  grid(
    columns: (auto, 1fr, auto),
    column-gutter: 10pt,
    text(size: size-base - 0.5pt, fill: muted)[#year],
    text(weight: "bold")[#name],
    text(size: size-base - 1pt, fill: muted)[#issuer],
  )
}
