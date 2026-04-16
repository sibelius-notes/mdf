\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Riemann Funktionslehre: T–S–D–T (tonic–subdominant–dominant–tonic)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>1^\markup { \small "T" }
    <f' a' c''>1^\markup { \small "S" }
    <g' b' d''>1^\markup { \small "D" }
    <c' e' g'>1^\markup { \small "T" }
  }
  \layout { }
}
