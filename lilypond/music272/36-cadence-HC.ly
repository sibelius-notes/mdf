\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'2^\markup { \small "HC" } d'2
      \bar "||"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      a,2 g,2
      \bar "||"
    }
  >>
  \layout { }
}
