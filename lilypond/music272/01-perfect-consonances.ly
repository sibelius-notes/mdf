\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff {
    \clef treble \time 4/4 \key c \major
    \omit Score.BarNumber
    << { c''1^"unison" g'1^"P5" f'1^"P4" c''1^"octave" }
       \\ { c''1 c'1 c'1 c'1 } >>
  }
  \layout { }
}
