\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Melodic sequence: same figure at descending pitch levels
    \relative c'' {
      g4 f e8 f g4~ | g4 f e8 f d4~ |
      d4 c b8 c a4~ | a2 g2 |
    }
  }
  \layout { }
}
