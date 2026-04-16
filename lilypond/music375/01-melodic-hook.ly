\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Melodic hook: ascending leap then stepwise descent
    \relative c'' {
      g4 c8 b a4 g |
      f4 e d c2 |
    }
  }
  \layout { }
}
