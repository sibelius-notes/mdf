\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Riemann PLR operations: C major → P → C minor → L → Ab major → R → Ab minor
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>1^\markup { \small "C maj" }
    <c' ees' g'>1^\markup { \small "P→ C min" }
    <aes' c'' ees''>1^\markup { \small "L→ A♭ maj" }
    <aes' ces'' ees''>1^\markup { \small "R→ A♭ min" }
  }
  \layout { }
}
