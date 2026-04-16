\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Autumn Leaves A section in G minor: Cm7-F7-Bbmaj7-Ebmaj7-Am7b5-D7-Gm
\score {
  <<
    \new ChordNames {
      \chordmode {
        c1:m7 f1:7 bes1:maj7 ees1:maj7
        a1:m7.5- d1:7 g1:m
      }
    }
    \new Staff {
      \clef treble \key bes \major \time 4/4
      \omit Score.BarNumber
      c1 f1 bes1 ees1
      a1 d1 g1
    }
  >>
  \layout { }
}
