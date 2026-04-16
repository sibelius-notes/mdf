\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \tempo "Very fast (♩=200)"
    c''16^\markup { \small "Fission: two streams heard separately" } e'16 d''16 f'16 e''16 g'16 f''16 a'16 |
    g''16 b'16 a''16 c''16 b''16 d''16 c'''16 e''16 |
  }
  \layout { }
}
