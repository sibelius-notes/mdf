\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Dorian mode on D"
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    d'4 e'4
    ^\markup { \small "mi-fa" }
    f'4 g'4 |
    a'4 b'4 c''4
    ^\markup { \small "mi-fa" }
    d''4 |
  }
  \layout { }
}
