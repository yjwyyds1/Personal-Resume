// ============================================================
// THEME CONFIGURATION — tweak these values to customize the PDF
// ============================================================

// --- Colors ---
#let accent      = rgb("#2c3e50")   // headings, name, horizontal rules
#let text-clr    = rgb("#333333")   // body text
#let muted       = rgb("#7f8c8d")   // dates, subtitles, secondary info
#let divider     = rgb("#ccd0d5")   // section underline

// --- Typography ---
#let font-main   = ("Segoe UI", "Calibri", "Arial")
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
#let gap-section = 10pt    // space before each section heading
#let gap-entry   = 7pt     // space between entries
#let gap-bullet  = 1.5pt   // space between bullet points

// ============================================================
// GLOBAL PAGE SETUP
// ============================================================
#set page(paper: "a4", margin: margin-page)
#set text(font: font-main, size: size-base, fill: text-clr)
#set par(leading: 0.5em, justify: true)

// ============================================================
// REUSABLE COMPONENTS
// ============================================================

// Section heading — bold uppercase title + thin line below
#let section(title) = {
  v(gap-section, weak: true)
  text(size: size-section, weight: "bold", fill: accent, tracking: 1pt)[
    #upper(title)
  ]
  v(3pt)
  line(length: 100%, stroke: 0.4pt + divider)
  v(5pt)
}

// Single entry — used for work experience, education, etc.
//   title    = company / school name (bold)
//   subtitle = role / degree (italic, muted)
//   date     = date range (right-aligned, muted)
//   body     = description content (bullet points)
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

// Skill category: "Languages: Python, TypeScript, Rust"
#let skill-group(category, items) = {
  text(weight: "bold")[#category:]
  items.join(", ")
  v(2pt)
}

// Project entry with name, url and description
#let project(name, url, body) = {
  v(4pt)
  text(weight: "bold", size: size-base + 0.5pt)[#name]
  text(size: size-base - 1pt, fill: muted)[ | #url]
  v(1pt)
  body
}
