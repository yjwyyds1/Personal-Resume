// ============================================================
// theme-indigo.typ — 靛蓝优雅
// Indigo-violet accent, refined with subtle gradients, elegant spacing
// ============================================================

// --- Colors ---
#let accent      = rgb("#4338ca")
#let accent-light = rgb("#6366f1")
#let text-clr    = rgb("#1e1b4b")
#let muted       = rgb("#6b7280")
#let divider     = rgb("#d1d5db")
#let bg-tint     = rgb("#eef2ff")

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 11pt

// --- Page layout ---
#let margin-page = (
  top:    1.3cm,
  bottom: 1.1cm,
  left:   1.5cm,
  right:  1.5cm,
)

// --- Spacing ---
#let gap-section = 8pt
#let gap-entry   = 5pt
#let gap-bullet  = 1pt

// --- Chinese typesetting ---
#let section-transform = it => it
#let par-leading        = 0.62em

// ============================================================
// GLOBAL PAGE SETUP
// ============================================================
#set page(paper: "a4", margin: margin-page)
#set text(font: font-main, size: size-base, fill: text-clr, lang: "zh")
#set par(leading: par-leading, justify: true)

// ============================================================
// REUSABLE COMPONENTS
// ============================================================

// Header block — elegant split with gradient-like tint
#let header-block(name-block, contact-block) = {
  block(
    fill: bg-tint,
    inset: (x: 14pt, y: 12pt),
    radius: 6pt,
    outset: (bottom: 8pt),
  )[
    #grid(
      columns: (1fr, auto),
      column-gutter: 20pt,
      align(left)[#name-block],
      align(right)[#contact-block],
    )
  ]
}

// Section heading — accent dot + title with subtle underline
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent)[#section-transform(title)]
  v(3pt)
  line(length: 100%, stroke: 0.3pt + accent-light)
  v(4pt)
}

// Work/education entry — compact one-line header
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

// Bullet point
#let bullet(body) = {
  v(gap-bullet)
  [- #body]
}

// Skill category — category in accent color with light background pill
#let skill-group(category, items) = {
  text(weight: "bold", fill: accent)[#category：]
  text(fill: text-clr)[#items.join("、")]
  v(2pt)
}

// Project entry
#let project(name, url, body) = {
  v(3pt)
  text(weight: "bold", size: size-base + 0.5pt)[#name]
  text(size: size-base - 1pt, fill: muted)[ | #url]
  v(1pt)
  body
}

// Award entry — year | name | issuer (right-aligned)
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
