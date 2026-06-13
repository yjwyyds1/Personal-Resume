// ============================================================
// theme-compact.typ — 信息密集型风格
// Tech blue accent, left-border section headings, two-column layout
// ============================================================

// --- Colors ---
#let accent      = rgb("#1a5276")
#let text-clr    = rgb("#2c2c2c")
#let muted       = rgb("#6c7a89")
#let divider     = rgb("#bdc3c7")

// --- Typography ---
#let font-main   = ("Microsoft YaHei", "Noto Sans SC", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 11pt

// --- Page layout ---
#let margin-page = (
  top:    1.4cm,
  bottom: 1.2cm,
  left:   1.4cm,
  right:  1.4cm,
)

// --- Spacing ---
#let gap-section = 8pt
#let gap-entry   = 5pt
#let gap-bullet  = 1pt

// --- Chinese typesetting ---
#let section-transform = it => it
#let par-leading        = 0.6em

// ============================================================
// GLOBAL PAGE SETUP
// ============================================================
#set page(paper: "a4", margin: margin-page)
#set text(font: font-main, size: size-base, fill: text-clr, lang: "zh")
#set par(leading: par-leading, justify: true)

// ============================================================
// REUSABLE COMPONENTS
// ============================================================

// Section heading — left colored border instead of full-width line
#let section(title) = {
  v(gap-section, weak: true)
  block(
    stroke: (left: 2.5pt + accent, right: 0pt, top: 0pt, bottom: 0pt),
    inset: (left: 8pt, top: 2pt, bottom: 2pt, right: 0pt),
    outset: (bottom: 3pt),
  )[
    #text(size: size-section, weight: "bold", fill: accent)[#section-transform(title)]
  ]
}

// Work experience / education entry
#let entry(title, subtitle, date, body) = {
  v(gap-entry, weak: true)
  grid(
    columns: (1fr, auto),
    column-gutter: 6pt,
    text(weight: "bold", size: size-base + 0.5pt)[#title],
    text(size: size-base - 0.5pt, fill: muted)[#date],
    text(size: size-base - 0.5pt, fill: muted)[#subtitle],
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

// Skill category — rendered inside grid cells
#let skill-group(category, items) = {
  text(weight: "bold")[#category：]
  items.join("、")
  v(2pt)
}

// Skills grid — two-column layout to save vertical space
#let skills-grid(skills) = {
  grid(
    columns: (1fr, 1fr),
    column-gutter: 16pt,
    row-gutter: 3pt,
    ..skills
  )
}

// Project entry
#let project(name, url, body) = {
  v(3pt)
  text(weight: "bold", size: size-base + 0.5pt)[#name]
  text(size: size-base - 1pt, fill: muted)[ | #url]
  v(1pt)
  body
}

// Award entry — compact inline format
#let award(year, name, issuer) = {
  v(1.5pt)
  text(size: size-base - 0.5pt, fill: muted)[#year]
  h(5pt)
  text(weight: "bold")[#name]
  h(4pt)
  text(size: size-base - 1pt, fill: muted)[— #issuer]
}
