\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Minor ii-V-i in G minor: Am7b5 - D7b9 - Gm6
\score {
  <<
    \new ChordNames {
      \chordmode { a1:m7.5- d1:7.9- g1:m6 }
    }
    \new Staff {
      \clef treble \key g \minor \time 4/4
      \omit Score.BarNumber
      % Am7b5: A C Eb G
      <a c' ees' g'>1
      % D7b9: D F# A C Eb
      <d fis a c' ees'>1
      % Gm6: G Bb D E
      <g bes d' e'>1
    }
  >>
  \layout { }
}
