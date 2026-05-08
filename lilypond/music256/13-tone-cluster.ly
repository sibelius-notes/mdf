\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tone cluster notation: dense chromatic cluster using bracket + tremolo
% Cowell-style cluster in both hands; black-key cluster vs white-key cluster
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % White-key cluster C-D-E-F-G-A-B as chord
  <c d e f g a b>1^\markup { \tiny "white-key cluster" } |
  % Chromatic cluster from C to G#
  <c cis d dis e f>2^\markup { \tiny "chromatic cluster" }
  <g gis a ais b>2 |
  % Release: single note
  c'1\pp^\markup { \tiny "release" } |
  r1 |
}
lower = \relative c, {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % Bass chromatic cluster C-B (low register)
  <c cis d dis e f fis g>1\ff |
  % Pedal + cluster fragments
  <c g' c>2 <b f' b>2 |
  c1\ppp |
  r1 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
