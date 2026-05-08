\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Clausula cadential formula"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      ^ \markup { \italic "discantus" }
      e'4 f'4 e'4 d'4 |
      < d' d''>1 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "tenor" }
      a4 g4 f4 d4 |
      d1 |
    }
  >>
  \layout { }
}
