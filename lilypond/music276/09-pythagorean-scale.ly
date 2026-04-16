\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 7/4
    \omit Score.BarNumber
    c'1^\markup { \small "C (1/1)" }
    g'1^\markup { \small "G (3/2)" }
    d''1^\markup { \small "D (9/8×2)" }
    a'1^\markup { \small "A (27/16)" }
    e''1^\markup { \small "E (81/64×2)" }
    b'1^\markup { \small "B (243/128)" }
    fis''1^\markup { \small "F# (729/512×2)" }
  }
  \layout { }
}
