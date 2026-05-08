\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Whole-tone scale in Debussy style
upper = \relative c'' {
  \clef treble
  \time 4/4
  \omit Score.BarNumber
  \omit Staff.KeySignature
  % 6-note whole-tone run: C-D-E-F#-G#-A#
  c8^\markup { \small "Whole-tone: no leading tone, no tonic" } d e fis gis ais c r |
  % bar 2 — descending whole-tone
  c,8 d e fis gis ais r4 |
}
lower = \relative c {
  \clef bass
  \time 4/4
  \omit Score.BarNumber
  \omit Staff.KeySignature
  % augmented triad arpeggio (whole-tone subset)
  <c e gis>4\p ( e gis c |
  <c, e gis>1) |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
