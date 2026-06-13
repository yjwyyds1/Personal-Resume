// ============================================================
// theme-zen.typ — 禅意绿
// Calm sage green (#4d7c4f) with warm stone accents.
// Minimalist Japanese/Scandinavian fusion — very clean,
// lots of breathing room but efficient use of space.
// ============================================================

// --- Colors ---
#let accent      = rgb("#4d7c4f")
#let text-clr    = rgb("#3d3d3d")
#let muted       = rgb("#8a9a8b")
#let divider     = rgb("#d4ddd4")
#let bg-tint     = rgb("#f6f8f4")

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 10.5pt

// --- Page layout ---
#let margin-page = (
  top:    1.1cm,
  bottom: 0.9cm,
  left:   1.3cm,
  right:  1.3cm,
)

// --- Spacing ---
#let gap-section = 7pt
#let gap-entry   = 4pt
#let gap-bullet  = 0.5pt

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

// Section heading — bold title with a thin green left border bar (2pt)
// and very subtle bottom line in divider colour
#let section(title) = {
  v(gap-section, weak: true)
  block(
    stroke: (left: 2pt + accent, right: 0pt, top: 0pt, bottom: 0.3pt + divider),
    inset: (left: 10pt, top: 2pt, bottom: 4pt, right: 0pt),
    outset: (bottom: 4pt),
  )[
    #text(size: size-section, weight: "bold", fill: accent)[#section-transform(title)]
  ]
}

// Single entry — ONE-LINE header: "title · subtitle" bold left, date muted right
#let entry(title, subtitle, date, body) = {
  v(gap-entry, weak: true)
  grid(
    columns: (1fr, auto),
    column-gutter: 8pt,
    text(weight: "bold", size: size-base + 0.5pt)[#title · #subtitle],
    text(size: size-base - 0.5pt, fill: muted)[#date],
  )
  v(1.5pt)
  body
}

// Bullet point — small dot using centre dot character "·"
#let bullet(body) = {
  v(gap-bullet)
  [· #body]
}

// Skill category — "category：" accent bold, items joined by "、"
#let skill-group(category, items) = {
  text(weight: "bold", fill: accent)[#category：]
  text(fill: text-clr)[#items.join("、")]
  v(2pt)
}

// Project entry — bold name + muted url on same line, then body below
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
