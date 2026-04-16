\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Harmonic series: fundamental + partials 2-6 forming a major triad (corps sonore)
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    c1^\markup { \small "f (fund.)" }
    c'1^\markup { \small "2f" }
    g'1^\markup { \small "3f" }
    c''1^\markup { \small "4f" }
    e''1^\markup { \small "5f" }
    g''1^\markup { \small "6f → C maj triad" }
  }
  \layout { }
}
