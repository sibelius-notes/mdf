\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      f'4_\markup { \small "parallel tenths (outer voices)" } e' d' c' | b4 a g f | e1
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      d,4 c, bes,, a,, | g,,4 f,, e,, d,, | e,,1
      \bar "|."
    }
  >>
  \layout { }
}
