\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Notre Dame melismatic organum"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      \omit Staff.TimeSignature
      ^ \markup { \italic "duplum" }
      c'8 d'8 e'8 f'8 e'8 d'8 c'8 b8 |
      c'8 d'8 e'8 c'8 r4 r4 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      \omit Staff.TimeSignature
      _ \markup { \italic "tenor" }
      c1 |
      c1 |
    }
  >>
  \layout { }
}
