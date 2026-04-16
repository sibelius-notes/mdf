\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 12/4
    \omit Score.BarNumber
    \tempo "Ascending — endless illusion"
    c'1^\markup { \small "C (pitch class)" }
    cis'1^\markup { \small "C#" }
    d'1^\markup { \small "D" }
    dis'1^\markup { \small "D#" }
    e'1^\markup { \small "E" }
    f'1^\markup { \small "F" }
    fis'1^\markup { \small "F#" }
    g'1^\markup { \small "G" }
    gis'1^\markup { \small "G#" }
    a'1^\markup { \small "A" }
    bes'1^\markup { \small "Bb" }
    b'1^\markup { \small "B" }
  }
  \layout { }
}
