// ============================================================
// theme-plum.typ — 梅子玫瑰
// Rich plum purple with soft rose accents, elegant and creative
// ============================================================

// --- Colors ---
#let accent       = rgb("#7c3aed")
#let accent-soft  = rgb("#f43f5e")
#let text-clr     = rgb("#2e1065")
#let muted        = rgb("#8b7d9b")
#let divider      = rgb("#ddd6e8")
#let bg-tint      = rgb("#faf8ff")

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

// Section heading — plum bold title with gradient-like dual underline:
//   thin rose line (0.5pt), then a 1pt gap, then slightly thicker plum line (0.3pt)
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent)[#section-transform(title)]
  v(2pt)
  line(length: 100%, stroke: 0.5pt + accent-soft)
  v(1pt)
  line(length: 100%, stroke: 0.3pt + accent)
  v(3pt)
}

// Work/education entry — one-line header: "title · subtitle" bold left, date muted right
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

// Bullet point — dash style
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// Skill group — category in accent bold, items joined by "、"
#let skill-group(category, items) = {
  text(weight: "bold", fill: accent)[#category：]
  text(fill: text-clr)[#items.join("、")]
  v(2pt)
}

// Project entry — bold name + muted URL, then body
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
