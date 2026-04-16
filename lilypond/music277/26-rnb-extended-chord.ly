\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Cmaj9 voicing, then Gsus4 add9
      \mark "Cmaj9"
      <e' g' b' d''>1
      \mark "9sus4"
      <c' f' g' d''>1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c1 g,1
    }
  >>
  \layout { }
}
