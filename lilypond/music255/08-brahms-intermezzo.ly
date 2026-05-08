\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Brahms lyrical style — Ab major, 3/4, cantabile
upper = \relative c'' {
  \clef treble
  \key as \major
  \time 3/4
  \tempo "Andante teneramente"
  \omit Score.BarNumber
  % bar 1 — flowing cantabile melody in 8th notes
  es8\p ( f es des c bes |
  % bar 2 — continuation
  as4 c8 bes as g |
  % bar 3 — rising arc
  f4 as8 g f es |
  % bar 4 — close
  <des f as>2.) |
}
lower = \relative c {
  \clef bass
  \key as \major
  \time 3/4
  \omit Score.BarNumber
  % rich harmony in thirds/octaves — Brahmsian texture
  <as c es>2. |
  <es' g bes>2. |
  <des f as>2. |
  <as es' as>2. |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
