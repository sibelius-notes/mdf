\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    r1_\markup { \small "f₁ = 200 Hz (absent)" }
    <g' c'' e''>1^\markup { \small "Partials 3,4,5 (600,800,1000 Hz) → hear C3!" }
  }
  \layout { }
}
