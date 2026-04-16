\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g'1^\markup { \small "f₁ = 392 Hz" }
    c''1^\markup { \small "f₂ = 523 Hz" }
    c'1^\markup { \small "Diff. tone f₂−f₁ ≈ 131 Hz (C3)" }
  }
  \layout { }
}
