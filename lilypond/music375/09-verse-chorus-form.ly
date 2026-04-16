\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \relative c' {
      % Verse (lower register, syllabic)
      \mark \markup { \bold "Verse" }
      e4 f g e | d4 e f2 |
      e4 d c d | e2 d2 |
      % Chorus (upper register, arch contour)
      \mark \markup { \bold "Chorus" }
      g'4 a b g | a4 b c2 |
      b4 a g a | g2 e2 |
    }
  }
  \layout { }
}
