\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Fourier decomposition: first 3 partials of a complex tone
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup { \small "f1" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c''1\f^\markup { \small "fundamental f1" }
    }
    \new Staff \with { instrumentName = \markup { \small "2f1" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      c'''1\mp^\markup { \small "2nd harmonic (1/2)" }
    }
    \new Staff \with { instrumentName = \markup { \small "3f1" } } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      g'''1\p^\markup { \small "3rd harmonic (1/3)" }
    }
  >>
  \header {
    piece = \markup { \small "Complex tone = f1 + (1/2)·2f1 + (1/3)·3f1 + ..." }
  }
  \layout { }
}
