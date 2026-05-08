\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Brahms, Symphony No. 1, Op. 68 — IV. finale main theme (C major)
% Broad cello-like melody (echoes Beethoven's "Ode to Joy"), Allegro non troppo
upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4
  \omit Score.BarNumber
  % Broad, singing theme in C major — "Ode to Joy" allusion
  c4\p( d4 e4 c4) |
  e4( f4 g4 r4) |
  a4( g4 f4 e4) |
  g2 e2 |
}
lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
  \omit Score.BarNumber
  % Cello-like bass with harmonic support
  <c g'>2\p <c g'>2 |
  <c g'>2 <c g'>2 |
  <f c'>2 <g d'>2 |
  <c g' e'>2 <c g'>2 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
