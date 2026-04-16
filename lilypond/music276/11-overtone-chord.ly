\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g' bes'>1^\markup { \small "Partials 4–7 of C2" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      <c, c g>1^\markup { \small "Partials 1–3 of C2" }
    }
  >>
  \layout { }
}
