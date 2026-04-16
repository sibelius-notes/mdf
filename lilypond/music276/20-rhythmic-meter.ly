\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'4\f^\markup { \small "4/4 metric accent" } c'4\mp c'4\mp c'4\mp |
      c'4\f c'4\mp c'4\mp c'4\mp |
    }
    \new Staff {
      \clef treble \key c \major \time 3/4
      \omit Score.BarNumber
      c'4\f_\markup { \small "3/4 metric accent" } c'4\mp c'4\mp |
      c'4\f c'4\mp c'4\mp |
    }
  >>
  \layout { }
}
