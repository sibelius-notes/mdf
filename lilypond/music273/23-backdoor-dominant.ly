\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Backdoor ii-V: Fm7 - Bb7 - Cmaj7
\score {
  <<
    \new ChordNames {
      \chordmode { f1:m7 bes1:7 c1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Fm7: F Ab C Eb
      <f aes c' ees'>1
      % Bb7: Bb D F Ab
      <bes d' f' aes'>1
      % Cmaj7: C E G B
      <c e g b>1
    }
  >>
  \layout { }
}
