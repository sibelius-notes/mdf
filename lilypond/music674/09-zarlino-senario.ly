\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Zarlino senario: ratios 1:2:3:4:5:6 as simultaneous pitches (harmonic series on C)
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    c1^\markup { \small "1" }
    c'1^\markup { \small "2" }
    g'1^\markup { \small "3" }
    c''1^\markup { \small "4" }
    e''1^\markup { \small "5" }
    g''1^\markup { \small "6" }
  }
  \layout { }
}
