// ============================================================
// theme-modern.typ — 现代极简风格
// Clean monochrome sans-serif, underline section headings
// ============================================================

// --- Colors ---
#let accent      = rgb("#2c3e50")
#let text-clr    = rgb("#333333")
#let muted       = rgb("#7f8c8d")
#let divider     = rgb("#ccd0d5")

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9.5pt
#let size-name   = 22pt
#let size-section = 11.5pt

// --- Page layout ---
#let margin-page = (
  top:    1.6cm,
  bottom: 1.4cm,
  left:   1.8cm,
  right:  1.8cm,
)

// --- Spacing ---
#let gap-section = 10pt
#let gap-entry   = 7pt
#let gap-bullet  = 1.5pt

// --- Chinese typesetting ---
#let section-transform = it => it
#let par-leading        = 0.65em

// ============================================================
// GLOBAL PAGE SETUP
// ============================================================
#set page(paper: "a4", margin: margin-page)
#set text(font: font-main, size: size-base, fill: text-clr, lang: "zh")
#set par(leading: par-leading, justify: true)

// ============================================================
// REUSABLE COMPONENTS
// ============================================================

// Section heading — bold title + thin line below
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent, tracking: 1pt)[
    #section-transform(title)
  ]
  v(3pt)
  line(length: 100%, stroke: 0.4pt + divider)
  v(5pt)
}

// Work experience / education entry
#let entry(title, subtitle, date, body) = {
  v(gap-entry, weak: true)
  grid(
    columns: (1fr, auto),
    column-gutter: 6pt,
    text(weight: "bold", size: size-base + 0.5pt)[#title],
    text(size: size-base - 0.5pt, fill: muted)[#date],
    text(style: "italic", size: size-base - 0.5pt, fill: muted)[#subtitle],
    [],
  )
  v(2pt)
  body
}

// Bullet point
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// Skill category
#let skill-group(category, items) = {
  text(weight: "bold")[#category：]
  items.join("、")
  v(2pt)
}

// Project entry
#let project(name, url, body) = {
  v(4pt)
  text(weight: "bold", size: size-base + 0.5pt)[#name]
  text(size: size-base - 1pt, fill: muted)[ | #url]
  v(1pt)
  body
}

// Award entry — compact inline format
#let award(year, name, issuer) = {
  v(2pt)
  text(size: size-base - 0.5pt, fill: muted)[#year]
  h(6pt)
  text(weight: "bold")[#name]
  h(4pt)
  text(size: size-base - 1pt, fill: muted)[— #issuer]
}
