\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven Op.132 "Heiliger Dankgesang" — F Lydian chorale
% F Lydian: F G A B C D E F (B-natural, no Bb)
upper = \relative c'' {
  \clef treble
  \key f \major
  \time 4/4
  \omit Score.BarNumber
  \override Staff.TimeSignature.stencil = ##f
  % bar 1 — chorale in whole notes
  f1 |
  % bar 2 — ascending Lydian melody with characteristic B-natural
  g1 |
  % bar 3 — A, then raised B (Lydian)
  a1 |
  b1^\markup { "↑ B♮ (Lydian)" } |
}
lower = \relative c' {
  \clef bass
  \key f \major
  \time 4/4
  \omit Score.BarNumber
  \override Staff.TimeSignature.stencil = ##f
  % white-key harmonies throughout
  <f a c>1^\markup { \small "Lydian mode" } |
  <e g c>1 |
  <c e a>1 |
  <b d g>1 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
