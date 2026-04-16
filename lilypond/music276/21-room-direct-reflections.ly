\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \tempo "Direct + Early Reflections"
    c'4\f^\markup { \small "Direct (0 ms)" }
    r8 c'8\mf^\markup { \small "+15 ms" }
    r8 c'8\mp^\markup { \small "+30 ms" }
    r8 c'8\p^\markup { \small "+50 ms" } |
    r8 c'8\pp^\markup { \small "+80 ms" }
    r4 c'4\ppp^\markup { \small "Reverb tail" }
    r4 |
  }
  \layout { }
}
