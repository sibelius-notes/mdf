\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Theme and variation: 4-bar theme, then 4-bar rhythmic variation
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \mark \markup { \small \bold "Theme" }
      c'2 e'2 | f'2 g'2 | a'2 g'2 | e'1 |
      \mark \markup { \small \bold "Var. I" }
      c'8 e'8 c'8 e'8 e'8 g'8 e'8 g'8 |
      f'8 a'8 f'8 a'8 g'8 b'8 g'8 b'8 |
      a'8 g'8 a'8 g'8 g'8 f'8 g'8 f'8 |
      e'4 e'4 e'2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      <c e g>1 | <f a c'>1 | <f a c'>2 <g, b, d>2 | <c e g>1 |
      <c e g>1 | <f a c'>1 | <f a c'>2 <g, b, d>2 | <c e g>1 |
    }
  >>
  \layout { }
}
