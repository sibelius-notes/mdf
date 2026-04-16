\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' fis'>1^\markup { \small "Tritone C–F# (ambiguous: up or down?)" }
    <fis' c''>1^\markup { \small "Tritone F#–C (same content, flipped)" }
  }
  \layout { }
}
