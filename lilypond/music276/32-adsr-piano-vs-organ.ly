\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'4\f^\markup { \small "Piano: fast attack, long decay" } c'4\mp c'4\p c'4\pp |
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      c'1\mf_\markup { \small "Organ: instant on/off, flat sustain" } |
    }
  >>
  \layout { }
}
