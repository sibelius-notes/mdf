\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' g'>1^\markup { \small "Pure 5th: C–G (702.0¢)" }
    <c' g'>1^\markup { \small "Meantone 5th: C–G (696.6¢, −5.4¢)" }
    <gis' ees''>1^\markup { \small "Wolf 5th: G#–Eb (737.6¢, +35.6¢)" }
  }
  \layout { }
}
