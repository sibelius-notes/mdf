\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Time-point set: rhythmic positions 0-11 within a measure of 12/16
  % Isomorphic to pitch-class space Z_12
  \new Staff \with { \omit KeySignature } {
    \clef percussion
    \omit Score.BarNumber
    \time 12/16
    % Show a time-point set like {0,1,4,6,9,11}
    c16^\markup { \tiny "tp 0" }
    c16^\markup { \tiny "tp 1" }
    r16
    r16
    c16^\markup { \tiny "tp 4" }
    r16
    c16^\markup { \tiny "tp 6" }
    r16
    r16
    c16^\markup { \tiny "tp 9" }
    r16
    c16^\markup { \tiny "tp 11" }
  }
  \layout { }
}
