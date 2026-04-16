\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 2/2
    \omit Score.BarNumber
    << { g'2^"cons." d'2^"pass."  f'2^"cons." e'2^"pass." }
       \\ { c'2        c'2         c'2          c'2 } >>
  }
  \layout { }
}
