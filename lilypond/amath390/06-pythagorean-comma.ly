\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Pythagorean comma: twelve pure fifths overshoot seven octaves by 23.46c
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: B# (enharmonic C, but 23.46c sharp) vs C
      bis'1^\markup { \small "B# (+23.46c)" }
      |
      % Bar 2: schematic — 12 fifths closing upward
      c'8^\markup { \tiny "C" } g'8^\markup { \tiny "G" }
      d''8^\markup { \tiny "D" } a''8^\markup { \tiny "A" }
      e''8^\markup { \tiny "E" } b''8^\markup { \tiny "B" }
      fis'''8^\markup { \tiny "F#" } cis'''8^\markup { \tiny "C#" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: true C (7 octaves reference)
      c'1_\markup { \small "C (0c)" }
      |
      % Bar 2: 7 octaves schematic
      c,2_\markup { \tiny "7 octaves" } c''2
    }
  >>
  \header {
    piece = \markup { \small "Pythagorean comma: 12 fifths - 7 octaves = 23.46c" }
  }
  \layout { }
}
