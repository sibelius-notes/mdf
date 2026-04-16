\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Tin Pan Alley turnaround: I-VI-ii-V
    \chordmode {
      c1 | a:m | d:m | g:7 |
    }
  }
  \layout { }
}
