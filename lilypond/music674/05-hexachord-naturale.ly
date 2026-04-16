\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Medieval hexachord naturale: ut-re-mi-fa-sol-la on C
\score {
  \new Staff {
    \clef treble \key c \major \time 6/4
    \omit Score.BarNumber
    c'1^\markup { \small "ut" }
    d'1^\markup { \small "re" }
    e'1^\markup { \small "mi" }
    f'1^\markup { \small "fa" }
    g'1^\markup { \small "sol" }
    a'1^\markup { \small "la" }
  }
  \layout { }
}
