\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \time 4/4
      \omit Score.BarNumber
      % C major → E major (chromatic mediant: ascending major third)
      \key c \major
      \mark "C major"
      <e' g' c''>2
      \bar "||"
      \key e \major
      \mark "E major"
      <gis' b' e''>2 |
      % E major → Ab major (descending chromatic mediant)
      \key e \major
      <gis' b' e''>2
      \bar "||"
      \key aes \major
      \mark "Ab major"
      <aes' c'' ees''>2 |
    }
    \new Staff {
      \clef bass \time 4/4
      \omit Score.BarNumber
      \key c \major c1
      \key e \major e1
    }
  >>
  \layout { }
}
