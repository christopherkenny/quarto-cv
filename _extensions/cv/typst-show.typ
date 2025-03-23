
#show: doc => cv(
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    (
      name: [$it.name.literal$],
      $for(it.affiliations)$
      $if(it.name)$
      university: [$it.name$],
      $endif$
      $if(it.department)$
      department: [$it.department$],
      $endif$
      $endfor$

      $if(it.degrees)$
      degrees: [$for(it.degrees)$$it$$sep$, $endfor$],
      $endif$

      $if(it.metadata.title)$
      role:  [$it.metadata.title$],
      $endif$

      $if(it.phone)$
      phone: "$it.phone$",
      $endif$

      $if(it.email)$
      email: [$it.email$],
      $endif$
      $if(it.url)$
      website: [$it.url$]
      $endif$
    ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(margin)$
  margin: ($for(margin/pairs)$$margin.key$: $margin.value$,$endfor$),
$endif$
$if(papersize)$
  paper: "$papersize$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
$if(toc-indent)$
  toc_indent: $toc-indent$,
$endif$
  toc_depth: $toc-depth$,
  cols: $if(columns)$$columns$$else$1$endif$,
$if(linestretch)$
  linestretch: $linestretch$,
$endif$
$if(linkcolor)$
  linkcolor: "$linkcolor$",
$endif$
  doc,
)
