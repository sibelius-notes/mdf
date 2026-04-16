\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 5/4
    \omit Score.BarNumber
    c'1^\markup { \small "H1 (A₁ = 1)" }
    c''2^\markup { \small "H2 (A₂ = 1/2)" }
    g''4^\markup { \small "H3 (1/3)" }
    c'''4^\markup { \small "H4 (1/4)" }
    e'''4^\markup { \small "H5 (1/5)" }
  }
  \layout { }
}
