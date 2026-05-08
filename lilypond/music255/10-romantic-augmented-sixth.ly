\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Augmented sixth chord in Romantic context — A minor
upper = \relative c'' {
  \clef treble
  \key a \minor
  \time 4/4
  \omit Score.BarNumber
  % bar 1 — tonic A minor
  <e a c>1 |
  % bar 2 — German Aug 6th: Ab-C-Eb-F# (resolves outward)
  <es c' fis>1^\markup { \bold "Ger+6" } |
  % bar 3 — dominant E major
  <e b' dis>1 |
  % bar 4 — tonic return
  <e a c>1 |
}
lower = \relative c {
  \clef bass
  \key a \minor
  \time 4/4
  \omit Score.BarNumber
  % bar 1 — tonic
  <a, e' a>1^\markup { \small "i: A min" } |
  % bar 2 — German Aug 6th in bass (Ab)
  as1^\markup { \small "Ger+6" } |
  % bar 3 — dominant
  <e b'>1^\markup { \small "V: E" } |
  % bar 4 — tonic
  <a, e' a>1^\markup { \small "i: A min" } |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
