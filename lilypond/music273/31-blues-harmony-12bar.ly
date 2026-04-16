\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Basic 12-bar blues in C: I7-I7-I7-I7-IV7-IV7-I7-I7-V7-IV7-I7-I7
\score {
  <<
    \new ChordNames {
      \chordmode {
        c1:7 c1:7 c1:7 c1:7
        f1:7 f1:7
        c1:7 c1:7
        g1:7 f1:7
        c1:7 c1:7
      }
    }
    \new Staff {
      \clef treble \key f \major \time 4/4
      \omit Score.BarNumber
      % Just show chord roots as whole notes
      c1 c1 c1 c1
      f1 f1
      c1 c1
      g1 f1
      c1 c1
    }
  >>
  \layout { }
}
