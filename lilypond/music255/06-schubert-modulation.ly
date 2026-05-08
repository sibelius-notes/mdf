\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schubert third-relationship modulation: C major → E major
upper = \relative c'' {
  \clef treble
  \time 4/4
  \omit Score.BarNumber
  % bar 1 — C major
  \key c \major
  c4 e g e |
  % bar 2 — pivot: chromatic motion (Ab enters as bVI of C, reinterpreted as IV of E via enharmonic)
  \key c \major
  c4 e gis e |
  % bar 3 — E major arrives
  \key e \major
  b'4^\markup { \small "→ E major" } gis e gis |
  % bar 4 — E major confirmed
  b2 e,2 |
}
lower = \relative c {
  \clef bass
  \time 4/4
  \omit Score.BarNumber
  % bar 1 — tonic C
  \key c \major
  <c e g>1^\markup { \small "I: C" } |
  % bar 2 — chromatic pivot
  \key c \major
  <c e gis>1^\markup { \small "pivot: C aug ↔ E: IV♯" } |
  % bar 3 — E major dominant
  \key e \major
  <b, fis' b>1^\markup { \small "V: E" } |
  % bar 4 — E major tonic
  <e, b' e>1^\markup { \small "I: E" } |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
