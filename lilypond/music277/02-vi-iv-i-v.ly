\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { a1:m f1 c1 g1 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        e'1 c'1 e'1 d'1
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        <a, c e>1 <f, a, c>1 <c e g>1 <g, b, d>1
      }
    >>
  >>
  \layout { }
}
