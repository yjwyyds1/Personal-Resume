// ============================================================
// theme-slate.typ — Slate Pro
// Dark slate (#334155) accent with warm amber (#d97706) highlights.
// Inspired by modern dashboard UIs. Very information-dense.
// ============================================================

// --- Colors ---
#let accent       = rgb("#334155")
#let accent-warm  = rgb("#d97706")
#let text-clr     = rgb("#1e293b")
#let muted        = rgb("#64748b")
#let divider      = rgb("#cbd5e1")
#let bg-tint      = rgb("#f1f5f9")

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

// Section heading — bold title with thin amber underline (0.5pt), minimal gap
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent)[
    #section-transform(title)
  ]
  v(2pt)
  line(length: 100%, stroke: 0.5pt + accent-warm)
  v(3pt)
}

// Entry — ONE-LINE header: "title · subtitle" bold on left, date muted on right
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

// Bullet point — dash bullet with gap-bullet spacing
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// Skill group — "category：" in accent bold, items joined by "、"
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
    column-gutter: 8pt,
    text(size: size-base - 0.5pt, fill: muted)[#year],
    text(weight: "bold")[#name],
    text(size: size-base - 1pt, fill: muted)[#issuer],
  )
}
