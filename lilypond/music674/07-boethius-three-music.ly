\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Boethius three kinds of music — monochord ratios illustrating musica instrumentalis
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    c1^\markup { \small "mundana (cosmos)" }
    \bar "||"
    g1^\markup { \small "humana (soul)" }
    \bar "||"
    <c g c'>1^\markup { \small "instrumentalis (heard)" }
  }
  \layout { }
}
