\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 7/4
    \omit Score.BarNumber
    <c' c'>1^\markup { \small "P1" }
    <c' des'>1^\markup { \small "m2" }
    <c' d'>1^\markup { \small "M2" }
    <c' ees'>1^\markup { \small "m3" }
    <c' e'>1^\markup { \small "M3" }
    <c' fis'>1^\markup { \small "TT" }
    <c' c''>1^\markup { \small "P8" }
  }
  \layout { }
}
