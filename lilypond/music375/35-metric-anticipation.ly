\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Metric anticipation: melody arrives on "and of 4" before chord
    \relative c'' {
      g4 f e d |
      % Anticipation: c arrives on and-of-4
      r2 r4 r8 c8~ |
      c2~ c8 d e4 | c1 |
    }
  }
  \layout { }
}
