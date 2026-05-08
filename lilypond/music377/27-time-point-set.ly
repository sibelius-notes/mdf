\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Babbitt time-point set: {0,3,7,9,10} in 12/16 — Webern-style rhythmic score
% C4 throughout — the pattern is purely rhythmic, not melodic
% Each attack point labeled "tp = n"
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      \time 12/16
      % Bar 1: time-points {0,3,7,9,10}
      c'8^\markup { \tiny "tp 0" }
      r8
      r8
      % tp 3
      c'8^\markup { \tiny "tp 3" }
      r8
      r8
      % tp 6 absent
      r8
      % tp 7
      c'16^\markup { \tiny "tp 7" }
      r16
      % tp 8 absent
      r8
      % tp 9
      c'16^\markup { \tiny "tp 9" }
      % tp 10
      c'16^\markup { \tiny "tp 10" }
      r8
      \bar "||"
      % Bar 2: retrograde {10,9,7,3,0}
      r8
      r8
      % tp 2 absent
      r16
      c'16^\markup { \tiny "tp 2" }
      r8
      c'16^\markup { \tiny "tp 4" }
      r16
      r8
      c'8^\markup { \tiny "tp 7" }
      r8
      c'8^\markup { \tiny "tp 11" }
      \bar "|."
    }
  }
  \layout { }
}
