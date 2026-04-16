\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Chorus melody: peak notes, arch contour, stepwise descent
    \relative c'' {
      e4 f g a |
      g4 f e d |
      c4 d e2 |
    }
  }
  \layout { }
}
