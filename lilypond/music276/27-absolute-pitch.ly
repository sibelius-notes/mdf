\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    fis'1^\markup { \small "Name this pitch — F#4 (370 Hz)" }
    ees''1^\markup { \small "Eb5 (622 Hz)" }
    b1^\markup { \small "B3 (247 Hz)" }
    aes'1^\markup { \small "Ab4 (415 Hz)" }
  }
  \layout { }
}
