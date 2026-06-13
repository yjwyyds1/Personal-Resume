// ============================================================
// theme-midnight.typ — 午夜深海
// Deep navy (#1e3a5f) with electric cyan (#06b6d4) highlights.
// Dark mode inspired but on white paper. Bold, modern, tech-forward.
// ============================================================

// --- Colors ---
#let accent        = rgb("#1e3a5f")   // deep navy — headings, name
#let accent-bright = rgb("#06b6d4")   // electric cyan — underlines, highlights
#let text-clr      = rgb("#1a1a2e")   // near-black with blue undertone
#let muted         = rgb("#6b7280")   // secondary info
#let divider       = rgb("#c8d6e5")   // soft cool gray
#let bg-tint       = rgb("#f0f4fa")   // icy lavender-white tint

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 11pt

// --- Page layout ---
#let margin-page = (
  top:    1.0cm,
  bottom: 0.8cm,
  left:   1.2cm,
  right:  1.2cm,
)

// --- Spacing ---
#let gap-section = 6pt
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

// Section heading — bold title with thick cyan underline bar (1.5pt)
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent)[
    #section-transform(title)
  ]
  v(2pt)
  line(length: 100%, stroke: 1.5pt + accent-bright)
  v(4pt)
}

// Entry — ONE-LINE: "title · subtitle" bold left, date muted right
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

// Skill category — "category：" accent bold, items joined by "、"
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
