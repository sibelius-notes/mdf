\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 8/4
    \omit Score.BarNumber
    c'1^\markup { \small "0¢" }
    d'1^\markup { \small "+3.9¢" }
    e'1^\markup { \small "+13.7¢" }
    f'1^\markup { \small "-2.0¢" }
    g'1^\markup { \small "+2.0¢" }
    a'1^\markup { \small "+15.6¢" }
    b'1^\markup { \small "+11.7¢" }
    c''1^\markup { \small "0¢" }
  }
  \layout { }
}
