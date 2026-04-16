\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Flamenco Sketches modal sequence: C Ionian, Ab Lydian, Bb Mixolydian
\score {
  <<
    \new ChordNames {
      \chordmode { c1 aes1:maj7.11+ bes1:7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % C Ionian chord
      <c e g b>1
      % Ab Lydian (Abmaj7#11)
      <aes c ees g d'>1
      % Bb Mixolydian (Bb7)
      <bes d' f' aes'>1
    }
  >>
  \layout { }
}
