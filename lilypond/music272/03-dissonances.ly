\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  \new Staff {
    \clef treble \time 3/4 \key c \major
    \omit Score.BarNumber
    << { d'1^"m2" b'1^"M7" fis'1^"tritone" }
       \\ { c'1 c'1 c'1 } >>
  }
  \layout { }
}
