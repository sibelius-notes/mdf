\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chromatic mediant juxtaposition: Cmaj7 - Ebmaj7 (major third apart, no common tones)
\score {
  <<
    \new ChordNames {
      \chordmode { c1:maj7 ees1:maj7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c e g b>1
      <ees g bes d'>1
    }
  >>
  \layout { }
}
