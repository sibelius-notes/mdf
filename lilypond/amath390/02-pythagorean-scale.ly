\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Pythagorean major scale built by stacking pure 3:2 fifths
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c'1_\markup { \small "1:1" }   |
      d'1_\markup { \small "9:8" }   |
      e'1_\markup { \small "81:64" } |
      f'1_\markup { \small "4:3" }   |
      g'1_\markup { \small "3:2" }   |
      a'1_\markup { \small "27:16" } |
      b'1_\markup { \small "243:128" } |
      c''1_\markup { \small "2:1" }  |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c1 | c1 | c1 | c1 | c1 | c1 | c1 | c1 |
    }
  >>
  \layout { }
}
