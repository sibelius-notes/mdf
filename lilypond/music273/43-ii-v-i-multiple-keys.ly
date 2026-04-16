\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% ii-V-I in C, then Bb, then Eb (descending whole-step sequence)
\score {
  <<
    \new ChordNames {
      \chordmode {
        d2:m7 g2:7 c1:maj7
        c2:m7 f2:7 bes1:maj7
        bes2:m7 ees2:7 aes1:maj7
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      d2 g2 c1
      c2 f2 bes1
      bes2 ees2 aes1
    }
  >>
  \layout { }
}
