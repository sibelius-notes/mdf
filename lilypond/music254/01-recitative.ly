\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Secco recitative style"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      ^ \markup { \italic "voice" }
      e'4 f'4 g'4 g'4 |
      a'4 a'4 g'4 f'4 |
      e'2 r2 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "basso continuo" }
      c2. r4 |
      f2. r4 |
      c1 |
    }
  >>
  \layout { }
}
