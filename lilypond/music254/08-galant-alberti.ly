\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Galant melody with Alberti bass"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      ^ \markup { \italic "melody" }
      e'4 f'4 g'4 a'4 |
      g'4 f'4 e'2 |
      d'4 e'4 f'4 g'4 |
      e'2 c'2 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "Alberti bass" }
      \repeat unfold 4 { c8 g8 e'8 g8 } |
      \repeat unfold 4 { g,8 g8 d'8 g8 } |
      \repeat unfold 4 { f,8 f8 c'8 f8 } |
      \repeat unfold 4 { c,8 e8 g8 e8 } |
    }
  >>
  \layout { }
}
