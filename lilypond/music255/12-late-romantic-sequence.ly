\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chromatic descending-fifth sequence — Brahms/Dvořák style
myChords = \chordmode {
  \omit Score.BarNumber
  % G7 - C - E7 - A - C#7 - F# - Bb7 - Eb
  g1:7 | c1 | e1:7 | a1 | cis1:7 | fis1 | bes1:7 | es1 |
}
upper = \relative c'' {
  \clef treble
  \time 4/4
  \omit Score.BarNumber
  % melodic line through the sequence
  <b d f g>1\f |
  <c e g>1 |
  <b dis gis>1 |
  <a cis e>1 |
  <ais cis eis gis>1 |
  <ais cis fis>1 |
  <bes d f as>1 |
  <bes es g>1 |
}
lower = \relative c {
  \clef bass
  \time 4/4
  \omit Score.BarNumber
  g1 |
  c,1 |
  e1 |
  a,1 |
  cis1 |
  fis,1 |
  bes1 |
  es,1 |
}
\score {
  <<
    \new ChordNames \myChords
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
  >>
  \layout { }
}
