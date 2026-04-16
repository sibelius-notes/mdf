\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      e'2 d'2 c'2 b2 | a2 b2 c'2 e'2
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      c1 g,1
      \bar "|."
    }
  >>
  \layout { }
}
