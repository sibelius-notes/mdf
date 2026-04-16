\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    a'1^\markup { \small "A4 (440 Hz) — Violin: rich odd+even harmonics" }
    a'1^\markup { \small "A4 (440 Hz) — Clarinet: odd harmonics dominant" }
    a'1^\markup { \small "A4 (440 Hz) — Flute: weak upper harmonics" }
  }
  \layout { }
}
