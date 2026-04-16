\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Rhythm changes A section in Bb: Bbmaj7-G7-Cm7-F7-Fm7-Bb7-Ebmaj7-Ab7
\score {
  <<
    \new ChordNames {
      \chordmode {
        bes2:maj7 g2:7 c2:m7 f2:7
        f2:m7 bes2:7 ees2:maj7 aes2:7
      }
    }
    \new Staff {
      \clef treble \key bes \major \time 4/4
      \omit Score.BarNumber
      bes2 g2 c2 f2
      f2 bes2 ees2 aes2
    }
  >>
  \layout { }
}
