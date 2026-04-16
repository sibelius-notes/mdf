\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 11\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    << { c'4^"contrary" d' e' f' }
       \\ { g4       f   e   d } >>
  }
  \layout { }
}
