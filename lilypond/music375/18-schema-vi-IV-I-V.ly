\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Harmonic schema vi-IV-I-V (chorus, relative minor feel)
    \chordmode {
      a1:m | f1 | c1 | g1 |
    }
  }
  \layout { }
}
