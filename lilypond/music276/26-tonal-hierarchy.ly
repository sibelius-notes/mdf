\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>1^\markup { \small "Tonic triad (most stable)" }
    <g' b' d''>1^\markup { \small "Dominant (wants to resolve)" }
    <f' a' c''>1^\markup { \small "Subdominant" }
    fis'1^\markup { \small "^4 (least stable, tritone from tonic)" }
  }
  \layout { }
}
