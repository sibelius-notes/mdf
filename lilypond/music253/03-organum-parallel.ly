\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Parallel organum at the fifth"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      \omit Staff.TimeSignature
      ^ \markup { \italic "vox principalis" }
      d'4 e'4 f'4 g'4 |
      f'4 e'4 d'4 d'4 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      \omit Staff.TimeSignature
      _ \markup { \italic "vox organalis" }
      g4 a4 bes4 c'4 |
      bes4 a4 g4 g4 |
    }
  >>
  \layout { }
}
