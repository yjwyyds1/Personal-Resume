// ============================================================
// theme-ocean.typ — 深海蓝调
// Deep blue accent with warm contrast, modern sidebar feel, tag-style skills
// ============================================================

// --- Colors ---
#let accent      = rgb("#0369a1")
#let accent-warm = rgb("#0ea5e9")
#let text-clr    = rgb("#0f172a")
#let muted       = rgb("#64748b")
#let divider     = rgb("#cbd5e1")
#let bg-tint     = rgb("#f0f9ff")

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 11pt

// --- Page layout ---
#let margin-page = (
  top:    1.2cm,
  bottom: 1.0cm,
  left:   1.3cm,
  right:  1.3cm,
)

// --- Spacing ---
#let gap-section = 7pt
#let gap-entry   = 5pt
#let gap-bullet  = 1pt

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

// Header block — card with subtle border
#let header-block(name-block, contact-block) = {
  block(
    fill: bg-tint,
    stroke: 0.5pt + accent-warm,
    inset: (x: 12pt, y: 10pt),
    radius: 4pt,
    outset: (bottom: 8pt),
  )[
    #grid(
      columns: (1fr, auto),
      column-gutter: 16pt,
      align(left)[#name-block],
      align(right)[#contact-block],
    )
  ]
}

// Section heading — colored underline bar
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent)[#section-transform(title)]
  v(2pt)
  line(length: 100%, stroke: 1pt + accent-warm)
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

// Skill category — inline tags style
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
