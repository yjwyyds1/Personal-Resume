// ============================================================
// theme-fresh.typ — 青翠现代
// Teal-green accent, clean card-style header, compact layout
// ============================================================

// --- Colors ---
#let accent      = rgb("#0d9488")
#let accent-dark = rgb("#0f766e")
#let text-clr    = rgb("#1e293b")
#let muted       = rgb("#64748b")
#let divider     = rgb("#cbd5e1")
#let bg-tint     = rgb("#f0fdfa")

// --- Typography ---
#let font-main   = ("Noto Sans SC", "Microsoft YaHei", "Microsoft YaHei UI", "SimHei")
#let size-base   = 9pt
#let size-name   = 20pt
#let size-section = 11pt

// --- Page layout ---
#let margin-page = (
  top:    1.2cm,
  bottom: 1.0cm,
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

// Header block — left name+title, right contact, with tinted background strip
#let header-block(name-block, contact-block) = {
  block(
    fill: bg-tint,
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

// Section heading — accent left bar + bold title, no full-width line
#let section(title) = {
  v(gap-section, weak: true)
  block(
    stroke: (left: 3pt + accent, right: 0pt, top: 0pt, bottom: 0pt),
    inset: (left: 10pt, top: 1pt, bottom: 3pt, right: 0pt),
    outset: (bottom: 4pt),
  )[
    #text(size: size-section, weight: "bold", fill: accent)[#section-transform(title)]
  ]
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

// Skill category
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
