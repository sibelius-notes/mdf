\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Verse melody: syllabic, lower register, conversational
    \relative c' {
      e4 f g e |
      d4 e f2 |
      e4 d c d |
      e2 d2 |
    }
  }
  \layout { }
}
