\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Reharmonization of Autumn Leaves bars 7-8 (Gm tonic): three options
% Option shown: Gm(maj7) - Gm7 - Gm6 (inner-voice descent)
\score {
  <<
    \new ChordNames {
      \chordmode { g2:m7+ g2:m7 g1:m6 }
    }
    \new Staff {
      \clef treble \key g \minor \time 4/4
      \omit Score.BarNumber
      <g bes d' fis'>2 <g bes d' f'>2
      <g bes d' e'>1
    }
  >>
  \layout { }
}
