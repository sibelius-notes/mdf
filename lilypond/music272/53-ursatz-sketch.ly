\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      e''1^\markup { \small "Urlinie: 3̂ – 2̂ – 1̂" } d''1 c''1
      \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      c1_\markup { \small "Bassbrechung: I – V – I" } g,1 c1
      \bar "|."
    }
  >>
  \layout { }
}
