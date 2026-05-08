\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schoenberg Pierrot lunaire "Nacht" — 3-note passacaglia cell
upper = \relative c' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % bar 1 — free atonal response, fragmented
  r4 b'8\pp ( g4) r4 e8\ppp |
  % bar 2 — more fragments with rests
  r4 r8 b' ( g4) r4 |
  % bar 3 — isolated notes
  e8\ppp r8 r4 b'8\p ( g8 r4) |
  % bar 4 — sparse close
  r2 b8\pp r8 r4 |
}
lower = \relative c, {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % 3-note passacaglia cell: B-G-E (ascending minor 3rd, descending major 3rd)
  b4^\markup { \small "Nacht: [3-3] passacaglia cell" } g e r4 |
  b'4 g e r4 |
  r4 b' g e |
  b,4 g e r4 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
