\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 6/4
    \omit Score.BarNumber
    c'1^\markup { \small "H1 (forte)" }
    c''2^\markup { \small "H2 (mf)" }
    g''4^\markup { \small "H3 (mp)" }
    c'''4^\markup { \small "H4 (p)" }
    e'''4^\markup { \small "H5 (pp)" }
    g'''4^\markup { \small "H6 (ppp)" }
  }
  \layout { }
}
