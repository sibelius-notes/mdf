\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { g1:7 b1:m7.5- }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Dominant group: V7, VIIm7b5
      <g b d' f'>1
      <b d' f' a'>1
    }
  >>
  \layout { }
}
