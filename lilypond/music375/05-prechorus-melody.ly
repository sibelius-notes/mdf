\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Pre-chorus: ascending energy, denser rhythm, building
    \relative c' {
      g'8 g a a b4 b |
      c8 c d d e4 e |
    }
  }
  \layout { }
}
