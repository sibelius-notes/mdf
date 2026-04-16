\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff {
    \clef treble \time 4/4 \key c \major
    \omit Score.BarNumber
    << { e''1^"M3" ees''1^"m3" a'1^"M6" aes'1^"m6" }
       \\ { c'1 c'1 c'1 c'1 } >>
  }
  \layout { }
}
