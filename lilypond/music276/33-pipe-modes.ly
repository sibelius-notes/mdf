\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Open pipe: all harmonics — f1, 2f, 3f, 4f
  c1^\markup { \tiny "open f₁" } |
  c2^\markup { \tiny "2f₁" } g2^\markup { \tiny "3f₁" } |
  c2^\markup { \tiny "4f₁" } e2^\markup { \tiny "5f₁" } |
  r1 |
}

lower = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Closed pipe: odd harmonics only — f1, 3f, 5f
  r1_\markup { \tiny "Open pipe: all harmonics" } |
  r1 |
  r1 |
  c1_\markup { \tiny "Closed pipe: f₁" } |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Pipe Modes: Open (all) vs. Closed (odd only)" } }
  \layout { }
}
