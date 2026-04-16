\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    % Groove-establishing bass line
    \relative c {
      c4 c8 c r8 c8 c4 |
      f4 f8 f r8 f8 e4 |
    }
  }
  \layout { }
}
