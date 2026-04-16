\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Syntonic comma: just major third (5:4) vs Pythagorean major third (81:64) side by side
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e'>1^\markup { \small "5:4 just M3" }
    <c' eis'>1^\markup { \small "81:64 Pyth. M3 (+21.5¢)" }
  }
  \layout { }
}
