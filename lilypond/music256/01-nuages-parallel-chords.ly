\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Debussy Nuages — parallel major 9th chords over C pedal
upper = \relative c'' {
  \clef treble
  \time 4/4
  \omit Score.BarNumber
  \omit Staff.KeySignature
  % parallel major 9ths sliding chromatically: F#maj9 → Emaj9 → Dbmaj9
  % bar 1 — F# major 9 chord in 8th motion
  <fis ais cis eis gis>8\p ( <fis ais cis eis gis>
   <fis ais cis eis gis> <fis ais cis eis gis>
   <fis ais cis eis gis> <fis ais cis eis gis>
   <fis ais cis eis gis> <fis ais cis eis gis>) |
  % bar 2 — E major 9
  <e gis b dis fis>8 ( <e gis b dis fis>
   <e gis b dis fis> <e gis b dis fis>
   <e gis b dis fis> <e gis b dis fis>
   <e gis b dis fis> <e gis b dis fis>) |
  % bar 3 — Db major 9
  <des f as c es>8 ( <des f as c es>
   <des f as c es> <des f as c es>
   <des f as c es> <des f as c es>
   <des f as c es> <des f as c es>) |
  % bar 4 — dissolving
  <c es g bes d>8\pp ( <c es g bes d>
   <c es g bes d> <c es g bes d>
   <c es g bes d> <c es g bes d>
   <c es g bes d> <c es g bes d>) |
}
lower = \relative c, {
  \clef bass
  \time 4/4
  \omit Score.BarNumber
  \omit Staff.KeySignature
  % C pedal point sustained
  c1^\markup { \small "Nuages: parallel major 9ths" } |
  c1 |
  c1 |
  c1 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
