\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  c4^\markup { \tiny "C4 = 261.6 Hz" } c c c |
  c4 c c c |
}

lower = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4_\markup { \tiny "C2 = 65.4 Hz" } c c c |
  c4 c c c |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Octave Equivalence: C2 and C4 in Unison" } }
  \layout { }
}
