#let SimSun = (regular: "SimSun", bold: "Noto Serif CJK TC")
#let SimHei = (regular: "SimHei", bold: "Noto Sans Mono CJK TC")
#let SimFang = (regular: "SimFang", bold: "Noto Serif CJK TC")

// in: n号字体, 0为初号
// sn: 小n号, 0为小初
#let size = (
    i0: 42.1575pt,
    s0: 36.1350pt,
    i1: 26.0975pt,
    s1: 24.0900pt,
    i2: 22.0825pt,
    s2: 18.0675pt,
    i3: 16.0600pt,
    s3: 15.0563pt,
    i4: 14.0525pt,
    s4: 12.0450pt,
    i5: 10.5394pt,
    s5: 9.0338pt,
    i6: 7.5281pt,
    s6: 6.5244pt,
    i7: 5.5206pt,
    i8: 5.0188pt,
  )

#let s2-bold-text(body) = {
  text(font: SimSun.regular, size.s2, weight: "bold", body)
}

#let paper(
  title: "",
  author: "",
  author_id: "",
  faculty: "",
  major: "",
  teacher: "",
  self_title_or_degree: "",
  date: "",
  abstract_ch: [],
  abstract_en: [],
  body
) = {
  // 页面尺寸
  set page(
    margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 20mm)
  )

  let no-stroke = rect(
    stroke: 0pt
  )


  set text(font: SimSun.regular, lang: "zh")
  show heading: set text(font: SimSun.bold, weight: "bold", lang: "zh")
  set heading(numbering: "1.1")

  let under-line(body) = {
    rect(
      width: 100%,
      stroke: (
        bottom: 1pt + black
      ),
      {
        body
      }
    )
  }

  let msg-table = {
    grid(
      columns: (120pt, 120pt, 80pt, 120pt),
      s2-bold-text("学 生 姓 名："),
      under-line(s2-bold-text(author)),
      s2-bold-text("学 号："),
      under-line(s2-bold-text(author_id))
    )
    grid(
      columns: (120pt, 320pt),
      s2-bold-text("学 部（系）："),
      under-line(s2-bold-text(faculty)),
    )
    grid(
      columns: (120pt, 320pt),
      s2-bold-text("专 业 名 称："),
      under-line(s2-bold-text(major)),
    )
    grid(
      columns: (120pt, 120pt, 120pt, 80pt),
      s2-bold-text("指 导 教 师："),
      under-line(s2-bold-text(teacher)),
      s2-bold-text("职称或学位："),
      under-line(s2-bold-text(self_title_or_degree))
    )
  }

  align(center, image("./image/logo.jpg", width: 50%))
  align(center, {
    v(5pt)
    text(font: SimSun.bold, size.i0, weight: "bold", "毕业设计（论文）")
    v(20pt)
    text(font: SimSun.bold, size.s1, weight: 700, title)
    v(220pt)
    msg-table
    v(50pt)
    text(font: SimSun.bold, size.s2, weight: "bold", date)
  })

  pagebreak()
  pagebreak()
  pagebreak()

  let sign-area = align(left,
    grid(
      columns: (auto, 100pt, 50pt, 100pt),
      align(right, text(font: SimSun.regular, size.s4, weight: "regular", "论文（设计）作者签名：")),
      align(right, under-line("")),
      align(right, text(font: SimSun.regular, size.s4, weight: "regular", "日期：")),
      align(right, under-line("")),
    )
  )

  align(center, {
    v(30pt)
    text(font: SimHei.bold, size.i3, weight: "bold", "毕业设计（论文）独创性声明")
    v(50pt)
    text(font: SimSun.regular, size.s4, weight: "regular", "本人声明所呈交的毕业设计（论文）是本人在导师指导下进行的研究工作及取得的研究成果，除了文中特别加以标注和致谢的地方外，本论文中没有抄袭他人研究成果和伪造数据等行为。对本研究做出重要贡献的个人和集体，均已在论文中作了明确的说明并表示谢意。")
    v(50pt)
    sign-area
    v(100pt)
    text(font: SimHei.bold, size.i3, weight: "bold", "毕业设计（论文）使用授权声明")
    v(50pt)
    text(font: SimSun.regular, size.s4, weight: "regular", "本人完全了解文华学院有关保留、使用学位论文的规定。文华学院有权保留并向国家有关部门或机构送交毕业设计（论文）的复印件和电子文档，允许毕业设计（论文）被查阅和借阅，可以公布（包括刊登）论文的全部或部分内容。本人授权文华学院可以将本科毕业设计（论文）的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或其他复印手段保存、汇编毕业设计（论文）。")
    v(50pt)
    sign-area
  })
}
