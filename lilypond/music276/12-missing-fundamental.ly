\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Bar 1: partials 3-7 of C2 with no fundamental — missing fundamental
  <g c e g bes>1^\markup { \tiny "Missing fundamental: ear infers C2" } |
  % Bar 2: same chord, but now with C2 bass for comparison
  <g c e g bes>1^\markup { \tiny "same chord + actual C2 below" } |
}

lower = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  % Bar 1: no bass — perceived C
  r1_\markup { \tiny "perceived C" } |
  % Bar 2: actual C2 added
  c,1_\markup { \tiny "actual C2 = 65.4 Hz" } |
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Missing Fundamental: Partials 3–7 of C" } }
  \layout { }
}
