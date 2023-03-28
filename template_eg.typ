// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  abstract: [],
  authors: (),
  date: none,
  logo: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 20mm),
    numbering: "1",
    number-align: start,
  )

  // Save heading and body font families in variables.
  let body-font = "Linux Libertine"
  let sans-font = "Inria Sans"

  // Set body font family.
  set text(font: body-font, lang: "zh")
  show heading: set text(font: sans-font)
  set heading(numbering: "1.1")

  // Set run-in subheadings, starting at level 3.
  show heading: it => {
    if it.level > 2 {
      parbreak()
      text(11pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }


  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  v(0.1fr)
  if logo != none {
    align(center, image(logo, width: 50%))
  }
  align(center, {
    text(font: sans-font, 4em, weight: 700, "毕业设计（论文）")
    v(0.3fr)
    text(font: sans-font, 2em, weight: 700, title)
  })
  v(9fr)

  table(
    columns: (auto, auto, auto),
    align: horizon,
    [学 生 姓 名：], [], [学号：], [],
    "学 部（系）："
  )

  text(1.1em, date)
  v(1.2em, weak: true)

  // Author information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(start)[
        *#author.name* \
        #author.email
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()

  // Abstract page.
  v(1fr)
align(center)[
    #heading(
      outlined: false,
      numbering: none,
      text(0.85em, smallcaps[Abstract]),
    )
    #abstract
  ]
  v(1.618fr)
  pagebreak()

  // Table of contents.
  outline(depth: 3, indent: true)
  pagebreak()


  // Main body.
  set par(justify: true)

  body
}