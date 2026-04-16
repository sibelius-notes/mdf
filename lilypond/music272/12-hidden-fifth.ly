\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 12\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      e'2^\markup { \italic "hidden 5th — similar motion, upper by step" } d'2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c,2 g,2
    }
  >>
  \layout { }
}
