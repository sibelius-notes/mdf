\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% 12-TET major scale on C with cent labels
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c'1_\markup { \small "0c" }    |
      d'1_\markup { \small "200c" }  |
      e'1_\markup { \small "400c" }  |
      f'1_\markup { \small "500c" }  |
      g'1_\markup { \small "700c" }  |
      a'1_\markup { \small "900c" }  |
      b'1_\markup { \small "1100c" } |
      c''1_\markup { \small "1200c" } |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c1 | c1 | c1 | c1 | c1 | c1 | c1 | c1 |
    }
  >>
  \layout { }
}
