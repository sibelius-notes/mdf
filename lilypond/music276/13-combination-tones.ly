\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g1^\markup { \tiny "G4 = 392 Hz" } |
  c2^\markup { \tiny "C5 = 523 Hz" } g2^\markup { \tiny "G4 = 392 Hz" } |
  <g c>1^\markup { \tiny "Tartini: |523 − 392| = 131 Hz = C3" } |
}

lower = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  r1 |
  r1 |
  c1_\markup { \tiny "difference tone C3 (131 Hz)" } |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Combination (Tartini) Tones" } }
  \layout { }
}
