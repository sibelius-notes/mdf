\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new Staff {
    \clef tenor \key c \major \time 1/1
    \omit Score.BarNumber
    c1 d1 e1 f1 g1 e1 d1 c1
    \bar "|."
  }
  \layout { }
}
