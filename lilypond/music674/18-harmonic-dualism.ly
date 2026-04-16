\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Riemann harmonic dualism: major triad built upward vs minor triad built downward
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>1^\markup { \small "C maj (upward)" }
    <g' bes' d''>1^\markup { \small "G min (downward from G)" }
  }
  \layout { }
}
