\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Hook with rhythmic displacement: syncopated version
    \relative c'' {
      r8 g8~ g4~ g8 c b4~ |
      b8 a g4~ g8 f e4 |
    }
  }
  \layout { }
}
