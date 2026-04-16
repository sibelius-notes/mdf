\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Twelve-bar blues harmonic schema in C
    \chordmode {
      c1:7 | c:7 | c:7 | c:7 |
      f1:7 | f:7 | c:7 | c:7 |
      g1:7 | f:7 | c:7 | g:7 |
    }
  }
  \layout { }
}
