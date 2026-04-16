\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Voice leading in bass: Dm7(D) - G7(G) - Cmaj7(C), descending fifth motion
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    d,1 g,1 c,1
  }
  \layout { }
}
