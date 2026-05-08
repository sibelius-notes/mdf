\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Wolf/Schumann Lied texture: piano right hand doubles vocal melody
% while inner voice moves independently; E major, "innig" character
vocal = \relative c'' {
  \clef treble
  \key e \major
  \time 4/4
  \omit Score.BarNumber
  % Voice: flowing, syllabic Lied melody
  e4^\markup { \italic "Voice" } fis4 gis4 a4 |
  b2~ b8 a8 gis4 |
  fis4 e4 dis4 e4 |
  e2. r4 |
}
upper = \relative c'' {
  \clef treble
  \key e \major
  \time 4/4
  \omit Score.BarNumber
  % Piano RH: doubles voice on top, inner voice below in independent motion
  <e b>4^\markup { \italic "piano RH doubles + inner voice" }
  <fis b>4 <gis b>4 <a cis>4 |
  <b e>2~ <b e>8 <a cis>8 <gis b>4 |
  <fis a>4 <e gis>4 <dis fis>4 <e gis>4 |
  <e gis>2. r4 |
}
lower = \relative c {
  \clef bass
  \key e \major
  \time 4/4
  \omit Score.BarNumber
  % Piano LH: arpeggiated bass — Lied accompaniment pattern
  <e gis b>4\mp r4 <e gis b>4 r4 |
  <b' fis'>4 r4 <b fis'>4 r4 |
  <a e'>4 r4 <b, fis' b>4 r4 |
  <e b e>2. r4 |
}
\score {
  <<
    \new Staff \vocal
    \new GrandStaff <<
      \new Staff \upper
      \new Staff \lower
    >>
  >>
  \layout { }
}
