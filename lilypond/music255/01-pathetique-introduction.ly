\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven Op.13 "Pathétique" — Grave introduction, C minor
upper = \relative c' {
  \clef treble
  \key c \minor
  \time 4/4
  \tempo "Grave"
  \omit Score.BarNumber
  % bar 1 — forte-piano opening, dotted rhythmic cry
  <c es g>2.\f^\markup { \italic "Grave" } ~ <c es g>8 r8 |
  % bar 2 — melody struggles upward with dotted rhythm
  c4.\p ( es8~ es4 d4~ |
  % bar 3 — chromatic ascent, dotted French-overture feel
  d4 c4~ c8 b8 c4) |
  % bar 4 — dominant arrival, descending bass
  <g b d f>2.\ff r4 |
}
lower = \relative c {
  \clef bass
  \key c \minor
  \time 4/4
  \omit Score.BarNumber
  % bar 1 — bass octave foundation
  <c, c'>2.~ <c c'>8 r8 |
  % bar 2 — sustained bass line
  g'2 g2 |
  % bar 3 — descending bass
  f4 e4 es4 d4 |
  % bar 4 — dominant bass
  <g, g'>2. r4 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
