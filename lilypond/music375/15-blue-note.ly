\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Blue note: flat-7 (bes) in C major context
    \relative c'' {
      g4 g bes g | f4 e d2 |
    }
  }
  \layout { }
}
