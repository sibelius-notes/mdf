\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Ritornello (A section)"
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 3/4
    c'4 d'4 e'4 |
    f'4 g'4 a'4 |
    g'4\trill f'4 e'4 |
    c'2. |
  }
  \layout { }
}
