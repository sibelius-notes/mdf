\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Eroica motivic development — fragmentation process
upper = \relative c'' {
  \clef treble
  \key es \major
  \time 3/4
  \omit Score.BarNumber
  % bar 1 — full theme compressed
  es4^\markup { \italic "full theme" } g8 es g4 |
  % bar 2 — 3-note cell: Eb-G-Bb
  es4^\markup { \italic "3-note cell" } g bes |
  % bar 3 — inversion: Bb-G-Eb
  bes4^\markup { \italic "inversion" } g es |
  % bar 4 — 2-note fragmentation
  es4^\markup { \italic "2-note cell" } g r4 |
}
lower = \relative c' {
  \clef bass
  \key es \major
  \time 3/4
  \omit Score.BarNumber
  % bar 1 — supporting bass
  <es, bes' es>2. |
  % bar 2 — bass cell
  es4 g bes |
  % bar 3 — inverted bass
  bes4 g es |
  % bar 4 — stripped bass
  <es bes'>2 r4 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
