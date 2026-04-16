\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { aes1:maj7.11+ }
    }
    \new Staff {
      \clef treble \key aes \major \time 4/4
      \omit Score.BarNumber
      <aes c ees g d'>1
    }
  >>
  \layout { }
}
