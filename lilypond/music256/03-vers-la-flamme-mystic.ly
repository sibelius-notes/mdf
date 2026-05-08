\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Scriabin Op.72 "mystic chord": C-F#-Bb-E-A-D
upper = \relative c'' {
  \clef treble
  \time 4/4
  \omit Score.BarNumber
  \omit Staff.KeySignature
  % bar 1 — mystic chord as whole-note cluster voicing
  <fis bes e a d>1^\markup { \small "Mystic chord: [0,6,10,4,9,2]" } |
  % bar 2 — arpeggio upward from bass
  c,16^\markup { \italic "Vers la flamme" } fis bes e a d fis bes
   e a d fis bes4~ bes8 r8 |
}
lower = \relative c, {
  \clef bass
  \time 4/4
  \omit Score.BarNumber
  \omit Staff.KeySignature
  % C pedal
  c1 |
  c2 r2 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
