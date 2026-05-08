\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Lewin's Generalized Interval System (GMIT, 1987):
% Two transposed major triads; int(C,E) = M3 = 4 semitones shown between staves
% T4 maps {C,E,G} → {E,G#,B}
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g'>2^\markup { \small "{C, E, G}" }
      <c' e' g'>2 |
      <e' gis' b'>2^\markup { \small "T₄{C,E,G} = {E, G♯, B}" }
      <e' gis' b'>2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "GIS source" } c2 |
      e2_\markup { \small "int(C,E) = 4 semitones = M3" } e2
    }
  >>
  \layout { }
}
