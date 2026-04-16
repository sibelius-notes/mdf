\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Melodic apex: phrase builds to single climactic high note
    \relative c'' {
      e4 f g a |
      \mark \markup { \circle "apex" }
      c2 b4 a |
      g4 f e d | c2. r4 |
    }
  }
  \layout { }
}
