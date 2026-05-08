\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Just intonation major scale (5-limit tuning) on C
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c'1_\markup { \small "1:1" }  |
      d'1_\markup { \small "9:8" }  |
      e'1_\markup { \small "5:4" }  |
      f'1_\markup { \small "4:3" }  |
      g'1_\markup { \small "3:2" }  |
      a'1_\markup { \small "5:3" }  |
      b'1_\markup { \small "15:8" } |
      c''1_\markup { \small "2:1" } |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c1 | c1 | c1 | c1 | c1 | c1 | c1 | c1 |
    }
  >>
  \layout { }
}
