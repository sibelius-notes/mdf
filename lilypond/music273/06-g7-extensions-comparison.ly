\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { g1:7 g1:9 g1:13 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % G7 shell: root, M3, m7
      <g b f'>1
      % G9: adds ninth (A)
      <g b f' a'>1
      % G13: adds thirteenth (E), omit fifth
      <g b f' e''>1
    }
  >>
  \layout { }
}
