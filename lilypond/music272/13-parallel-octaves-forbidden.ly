\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 12\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'2^\markup { \bold "✗" \italic "parallel octaves — forbidden" } d'2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c,2 d,2
    }
  >>
  \layout { }
}
