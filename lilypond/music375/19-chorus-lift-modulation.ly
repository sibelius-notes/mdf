\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Chorus "lift": original key then modulate up a whole step
    \relative c'' {
      \mark \markup { \italic "C major" }
      g4 a g e | f4 e d2 |
      \mark \markup { \italic "D major" }
      \key d \major
      a'4 b a fis | g4 fis e2 |
    }
  }
  \layout { }
}
