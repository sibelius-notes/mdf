\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { c1:maj7 c1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Close voicing: C E G B
      <c e g b>1
      % Drop-2: second from top (G) dropped octave -> B E C G
      <c, e g b>1
    }
  >>
  \layout { }
}
