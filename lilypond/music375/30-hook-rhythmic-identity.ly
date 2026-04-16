\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Hook: strong rhythmic identity with syncopation
    \relative c'' {
      r8 g4. c4 b8 a~ |
      a8 g4. r2 |
    }
  }
  \layout { }
}
