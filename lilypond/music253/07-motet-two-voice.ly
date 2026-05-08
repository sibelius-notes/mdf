\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "13th-century motet: motetus and tenor"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 3/4
      ^ \markup { \italic "motetus" }
      c'8 d'8 e'8 f'8 g'8 a'8 |
      g'8 f'8 e'4 r4 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 3/4
      _ \markup { \italic "tenor" }
      d2. |
      g2. |
    }
  >>
  \layout { }
}
