\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  c2^\markup { \tiny "C5" } fis2^\markup { \tiny "F#5 — ascending?" } |
  fis2 c2 |
}

lower = \relative c' {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2_\markup { \tiny "C4" } fis2_\markup { \tiny "F#3 — descending?" } |
  fis2 c2 |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Tritone Paradox (Deutsch): same interval, up or down?" } }
  \layout { }
}
