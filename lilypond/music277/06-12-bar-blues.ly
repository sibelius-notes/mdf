\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode {
        c1:7 c1:7 c1:7 c1:7
        f1:7 f1:7 c1:7 c1:7
        g1:7 f1:7 c1:7 g1:7
      }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % 12-bar blues: I7–IV7–V7 root notes
      c1 c1 c1 c1
      f,1 f,1 c1 c1
      g,1 f,1 c1 g,1
    }
  >>
  \layout { }
}
