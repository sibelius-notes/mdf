\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \relative c'' {
      % A section (label: A)
      \mark \markup { \bold "A" }
      c4 e g e | f4 e d2 |
      % A section repeated (label: A)
      \mark \markup { \bold "A" }
      c4 e g e | f4 e d2 |
      % B section (label: B)
      \mark \markup { \bold "B" }
      a'4 g f e | d4 e f2 |
      % Final A section (label: A)
      \mark \markup { \bold "A" }
      c4 e g e | f4 e c2 |
    }
  }
  \layout { }
}
