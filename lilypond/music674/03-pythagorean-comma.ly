\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Pythagorean comma: C vs B# after 12 stacked perfect fifths
% B# is enharmonically C but slightly higher — shown as whole notes side by side
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c''1^\markup { \small "C (7 octaves)" }
    bis'1^\markup { \small "B♯ (12 fifths) ≈ 23.46¢ higher" }
  }
  \layout { }
}
