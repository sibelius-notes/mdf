\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Scale comparison: Pythagorean vs. Just vs. 12-TET for major third and major sixth
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup { \small "Pyth." } } {
      \clef treble \key c \major \time 2/4 \omit Score.BarNumber
      e'1^\markup { \small "+8c" }  |
      a'1^\markup { \small "+6c" }  |
    }
    \new Staff \with { instrumentName = \markup { \small "Just" } } {
      \clef treble \key c \major \time 2/4 \omit Score.BarNumber
      e'1^\markup { \small "-14c" } |
      a'1^\markup { \small "-16c" } |
    }
    \new Staff \with { instrumentName = \markup { \small "12-TET" } } {
      \clef treble \key c \major \time 2/4 \omit Score.BarNumber
      e'1^\markup { \small "0c" }   |
      a'1^\markup { \small "0c" }   |
    }
  >>
  \layout { }
}
