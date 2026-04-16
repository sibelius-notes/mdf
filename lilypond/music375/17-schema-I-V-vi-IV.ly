\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Harmonic schema I-V-vi-IV (verse)
    \chordmode {
      c1 | g1 | a:m | f1 |
    }
  }
  \layout { }
}
