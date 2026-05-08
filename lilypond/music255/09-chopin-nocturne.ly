\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chopin nocturne style — Bb major, 3/4, bel canto melody + broken-chord bass
upper = \relative c'' {
  \clef treble
  \key bes \major
  \time 3/4
  \omit Score.BarNumber
  % bar 1 — ornate bel canto melody
  d4.\p ( f8 es d |
  % bar 2 — with trill ornament
  c4 bes\trill a8 bes |
  % bar 3 — turn and continuation
  d4 \grace { c16 d } es8 d c bes |
  % bar 4 — close with improvisatory ending
  <bes d f>2.) |
}
lower = \relative c {
  \clef bass
  \key bes \major
  \time 3/4
  \omit Score.BarNumber
  % broken-chord Alberti-esque accompaniment
  bes,8\p ( f' bes f' bes, f' |
  c,8 g' c g' c, g' |
  bes,,8 f' bes f' bes, f' |
  bes,,8 f' bes f' bes, f') |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
