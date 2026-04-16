\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Stacked perfect fifths C-G-D-A-E; major third C-E is Pythagorean (81:64), sharper than just
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'2^\markup { \small "C" }
    g'2^\markup { \small "G (×3/2)" }
    d''2^\markup { \small "D (×3/2)" }
    a'2^\markup { \small "A (×3/2)" }
    e''1^\markup { \small "E=81:64 (sharp!)" }
  }
  \layout { }
}
