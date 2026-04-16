\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'4\f^\markup { \small "Dry (studio): sharp attack, fast decay" } r4 r2 |
      e'4\f r4 r2 |
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1\f_\markup { \small "Reverberant hall: notes blend, long tail" } |
      <c' e'>1\f |
    }
  >>
  \layout { }
}
