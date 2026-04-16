\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \time 4/4
    \omit Score.BarNumber
    % Power chords: root + fifth only (C5, G5, A5, F5)
    <c' g'>1 <g' d''>1 <a' e''>1 <f' c''>1
  }
  \layout { }
}
