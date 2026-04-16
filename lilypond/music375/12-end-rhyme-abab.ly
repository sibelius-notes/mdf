\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % End rhyme ABAB pattern, phrase endings marked
    \relative c'' {
      g4 f e d | \mark \markup { \circle "A" }
      c4 d e f | \mark \markup { \circle "B" }
      g4 a g e | \mark \markup { \circle "A" }
      f4 e d2 | \mark \markup { \circle "B" }
    }
  }
  \layout { }
}
