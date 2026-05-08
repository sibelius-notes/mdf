\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Bar 1: ascending arpeggiation of overtone chord
  c8^\markup { \tiny "2f" } g8^\markup { \tiny "3f" } c8^\markup { \tiny "4f" } e8^\markup { \tiny "5f" }
  g8^\markup { \tiny "6f" } g4 r8 |
  % Bar 2: held overtone chord
  <c, e g>2^\markup { \tiny "partials 4–6" } <c e g>2 |
}

lower = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c1_\markup { \tiny "C2 fundamental (1f)" } |
  c1_\markup { \tiny "sustained bass" } |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Overtone Chord on C2" } }
  \layout { }
}
