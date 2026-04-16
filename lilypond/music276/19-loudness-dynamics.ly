\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 6/4
    \omit Score.BarNumber
    a'1\ppp^\markup { \small "ppp (~40 dB)" }
    a'1\mp^\markup { \small "mp (~70 dB)" }
    a'1\fff^\markup { \small "fff (~100 dB)" }
  }
  \layout { }
}
