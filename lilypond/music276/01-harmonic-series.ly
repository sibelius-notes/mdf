\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  \tempo \markup { \italic "ad lib." }
  c4^\markup { \tiny "2" } g^\markup { \tiny "3" } c^\markup { \tiny "4" } e^\markup { \tiny "5" }
  g4^\markup { \tiny "6" } bes^\markup { \tiny "7" } c2^\markup { \tiny "8" }
}

lower = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c1_\markup { \tiny "fundamental (1)" }
  c1_\markup { \tiny "C2 — 65.4 Hz" }
}

\score {
  <<
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
  >>
  \header { piece = \markup { \bold "Harmonic Series on C2" } }
  \layout { }
}
