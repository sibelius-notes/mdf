\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    << { e'4^"oblique" e' e' e' }
       \\ { c'4         d'  e'  f' } >>
  }
  \layout { }
}
