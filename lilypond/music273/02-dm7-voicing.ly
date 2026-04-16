\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { d1:m7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <d f a c'>1
    }
  >>
  \layout { }
}
