\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { c1 bes1 f1 c1 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % I–bVII–IV–I: modal mixture, bVII borrowed from Mixolydian
        g'1 bes'1 a'1 g'1
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        <c e g>1 <bes, d f>1 <f, a, c>1 <c e g>1
      }
    >>
  >>
  \layout { }
}
