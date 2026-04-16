\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { g1:7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <g b d' f'>1
    }
  >>
  \layout { }
}
