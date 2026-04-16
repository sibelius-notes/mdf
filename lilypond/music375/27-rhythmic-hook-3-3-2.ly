\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Rhythmic hook: syncopated 3+3+2 pattern (in 8th notes)
    \relative c'' {
      g8 g g r8 g g r8 g r8 |
      g8 g g r8 g g r8 g r8 |
    }
  }
  \layout { }
}
