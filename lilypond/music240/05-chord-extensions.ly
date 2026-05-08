\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Jazz chord vocabulary: Bbmaj7, Bb9, Bb13
\score {
  <<
    \new ChordNames {
      \chordmode {
        bes1:maj7 |
        bes1:9 |
        bes1:13 |
      }
    }
    \new Staff {
      \clef treble \key bes \major \time 4/4 \omit Score.BarNumber
      <bes d' f' a'>1^\markup { \tiny "Bbmaj7" } |
      <bes d' f' a' c''>1^\markup { \tiny "Bb9" } |
      <bes d' f' a' c'' g''>1^\markup { \tiny "Bb13" } |
    }
  >>
  \layout { }
}
