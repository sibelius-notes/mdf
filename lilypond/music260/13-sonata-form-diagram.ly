\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Sonata form musical example: P-theme → transition → S-theme
% with section labels; C major (P) → G major (S)
upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4
  \omit Score.BarNumber
  % P-theme: strong, fanfare character in C major
  c4^\markup { \bold "P (I)" } e4 g4 c4 |
  g4 f4 e4 d4 |
  % Transition: sequential, modulating to G major
  e4^\markup { \bold "TR" } fis4 g4 a4 |
  b4 c4 d4 r4 |
  % S-theme: lyrical, in G major
  b4^\markup { \bold "S (V)" }\p a4 g4 a4 |
  b4( a4 g4) r4 |
}
lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
  \omit Score.BarNumber
  <c g'>4 r4 <c g'>4 r4 |
  <g d'>4 r4 <g d'>4 r4 |
  % Transition bass moves upward
  <e b'>4 r4 <g d'>4 r4 |
  <g d'>4 r4 <g d'>4 r4 |
  % S-theme bass: G major
  <g d'>4 r4 <g d'>4 r4 |
  <g d'>4 r4 <g d'>4 r4 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
