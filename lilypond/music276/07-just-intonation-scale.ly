\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 8/4
    \omit Score.BarNumber
    c'1^\markup { \small "1/1" }
    d'1^\markup { \small "9/8" }
    e'1^\markup { \small "5/4" }
    f'1^\markup { \small "4/3" }
    g'1^\markup { \small "3/2" }
    a'1^\markup { \small "5/3" }
    b'1^\markup { \small "15/8" }
    c''1^\markup { \small "2/1" }
  }
  \layout { }
}
