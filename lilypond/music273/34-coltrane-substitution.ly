\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Coltrane substitution: three key centers B, G, Eb (major thirds)
% F#7-Bmaj7 | D7-Gmaj7 | Bb7-Ebmaj7
\score {
  <<
    \new ChordNames {
      \chordmode {
        fis1:7 b1:maj7
        d1:7 g1:maj7
        bes1:7 ees1:maj7
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      fis1 b1
      d1 g1
      bes1 ees1
    }
  >>
  \layout { }
}
