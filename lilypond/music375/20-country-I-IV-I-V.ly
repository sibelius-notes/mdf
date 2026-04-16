\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Country pattern I-IV-I-V
    \chordmode {
      c1 | f1 | c1 | g1 |
    }
  }
  \layout { }
}
