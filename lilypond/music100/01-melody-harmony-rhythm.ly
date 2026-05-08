\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Three-staff StaffGroup illustrating the three basic elements of music
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup { \small "Melody" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c'4 e'4 g'4 e'4 |
      d'4 f'4 a'4 f'4 |
      e'4 g'4 b'4 g'4 |
      c''2 c''2 |
    }
    \new Staff \with { instrumentName = \markup { \small "Harmony" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      <c' e' g'>1^\markup { \tiny "I" } |
      <g b d'>1^\markup { \tiny "V" } |
      <a c' e'>1^\markup { \tiny "vi" } |
      <f a c'>1^\markup { \tiny "IV" } |
    }
    \new DrumStaff \with { instrumentName = \markup { \small "Rhythm" } } {
      \drummode {
        \time 4/4 \omit Score.BarNumber
        bd4 hh8 hh8 bd4 hh8 hh8 |
        bd4 hh8 hh8 bd4 hh8 hh8 |
        bd4 hh8 hh8 bd4 hh8 hh8 |
        bd4 hh8 hh8 bd4 hh8 hh8 |
      }
    }
  >>
  \layout { }
}
