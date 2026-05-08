\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% C major scale with interval labels above each successive note
\score {
  \new Staff {
    \clef treble \key c \major \omit Score.BarNumber \time 4/4
    c'4^\markup { \tiny "P1" }
    d'4^\markup { \tiny "M2" }
    e'4^\markup { \tiny "M3" }
    f'4^\markup { \tiny "P4" } |
    g'4^\markup { \tiny "P5" }
    a'4^\markup { \tiny "M6" }
    b'4^\markup { \tiny "M7" }
    c''4^\markup { \tiny "P8" } |
  }
  \layout { }
}
