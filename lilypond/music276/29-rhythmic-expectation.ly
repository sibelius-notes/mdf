\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'4\f^\markup { \small "Established pattern" } c'4\mp c'4\mp c'4\mp |
    c'4\f c'4\mp c'4\mp c'4\mp |
    c'4\f c'4\mp c'4\mp r4^\markup { \small "Violation: missing beat!" } |
  }
  \layout { }
}
