\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Anti-hook: stepwise monotone, boring by design
    \relative c'' {
      c4 d e f |
      g a b c2 |
    }
  }
  \layout { }
}
