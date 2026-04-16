\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' c'>1^\markup { \small "Unison (0 Hz apart) — no beating" }
    <c' d'>1^\markup { \small "Major 2nd (~204 cents) — within CB, rough" }
    <c' e'>1^\markup { \small "Major 3rd (~386 cents) — near CB edge" }
    <c' g'>1^\markup { \small "Perfect 5th (~702 cents) — outside CB, smooth" }
  }
  \layout { }
}
