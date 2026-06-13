// ============================================================
// theme-classic.typ — 传统正式风格
// Serif typeface, dark red accent, double-line header separator
// ============================================================

// --- Colors ---
#let accent      = rgb("#8b1a1a")
#let text-clr    = rgb("#333333")
#let muted       = rgb("#7f8c8d")
#let divider     = rgb("#b0a0a0")

// --- Typography ---
#let font-main   = ("Noto Serif SC", "SimSun", "NSimSun", "KaiTi")
#let size-base   = 9pt
#let size-name   = 24pt
#let size-section = 11.5pt

// --- Page layout ---
#let margin-page = (
  top:    2.0cm,
  bottom: 1.8cm,
  left:   2.2cm,
  right:  2.2cm,
)

// --- Spacing ---
#let gap-section = 12pt
#let gap-entry   = 8pt
#let gap-bullet  = 2pt

// --- Chinese typesetting ---
#let section-transform = it => it
#let par-leading        = 0.7em

// ============================================================
// GLOBAL PAGE SETUP
// ============================================================
#set page(paper: "a4", margin: margin-page)
#set text(font: font-main, size: size-base, fill: text-clr, lang: "zh")
#set par(leading: par-leading, justify: true)

// ============================================================
// REUSABLE COMPONENTS
// ============================================================

// Section heading — bold with wider tracking + thicker divider
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent, tracking: 3pt)[
    #section-transform(title)
  ]
  v(4pt)
  line(length: 100%, stroke: 0.6pt + divider)
  v(6pt)
}

// Work experience / education entry
#let entry(title, subtitle, date, body) = {
  v(gap-entry, weak: true)
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
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
