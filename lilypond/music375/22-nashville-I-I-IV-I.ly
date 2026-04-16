\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Nashville number system: 1-1-4-1 in C major
    \chordmode {
      c1 | c1 | f1 | c1 |
    }
  }
  \layout { }
}
