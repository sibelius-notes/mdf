\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1^\markup { \small "Open pipe: f₁" }
      c''1^\markup { \small "f₂ = 2f₁ (octave)" }
      g''1^\markup { \small "f₃ = 3f₁ (twelfth)" }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1_\markup { \small "Closed pipe: f₁" }
      g''1_\markup { \small "f₂ = 3f₁ (twelfth, skips octave)" }
      e'''1_\markup { \small "f₃ = 5f₁ (17th)" }
    }
  >>
  \layout { }
}
