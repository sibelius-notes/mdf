\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 6/4
    \omit Score.BarNumber
    c,1_"1: C" c_"2: C" g_"3: G" c'_"4: C" e'_"5: E" g'_"6: G"
  }
  \layout { }
}
