\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    a'1^\markup { \small "A4 = 440 Hz (concert tuning fork)" }
    a'2^\markup { \small "Same pitch" } a'2^\markup { \small "½ period" }
    a'4^\markup { \small "¼" } a'4 a'4 a'4 |
  }
  \layout { }
}
