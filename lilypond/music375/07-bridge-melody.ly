\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key a \minor \time 4/4
    \omit Score.BarNumber
    % Bridge melody: contrasting pitch area, relative minor feel
    \relative c'' {
      a4 g e f |
      g4 a b2 |
    }
  }
  \layout { }
}
