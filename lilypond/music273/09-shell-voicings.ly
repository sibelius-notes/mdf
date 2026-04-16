\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { g1:7 d1:m7 }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % G7 shell: root, M3, m7 (no 5th)
      <g b f'>1
      % Dm7 shell: root, m3, m7 (no 5th)
      <d f c'>1
    }
  >>
  \layout { }
}
