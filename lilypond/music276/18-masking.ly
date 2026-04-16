\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <a' b'>1^\markup { \small "Loud A4 masks soft B4 nearby (upward spread)" }
    a'1_\markup { \small "Masker (forte)" }
    b'1^\markup { \small "Target (piano) — partially masked" }
  }
  \layout { }
}
