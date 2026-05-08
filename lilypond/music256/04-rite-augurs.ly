\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Stravinsky Rite of Spring "Augurs of Spring" — bitonality
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  % Eb major triad, ff, accented — characteristic accent pattern in 8/4
  \time 8/4
  % bar 1 — Eb triad with irregular accent pulse
  es4\ff^\markup { \small "E♭ major" } es-> es es-> es-> es es-> es |
  % bar 2 — same with varied accent
  es4-> es es-> es es-> es-> es es-> |
}
lower = \relative c {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 8/4
  % E dominant 7th simultaneously — bitonality
  <e b' d gis>4\ff^\markup { \small "E dom7" }
   <e b' d gis>-> <e b' d gis> <e b' d gis>->
   <e b' d gis>-> <e b' d gis> <e b' d gis>-> <e b' d gis> |
  <e b' d gis>4-> <e b' d gis> <e b' d gis>-> <e b' d gis>
   <e b' d gis>-> <e b' d gis>-> <e b' d gis> <e b' d gis>-> |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
