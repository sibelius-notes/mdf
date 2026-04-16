\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Messiaen modes of limited transposition: Mode 1 (whole-tone) and Mode 2 (octatonic)
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % Mode 1: {0,2,4,6,8,10}
      c'4^\markup { \tiny "Mode 1" } d' e' fis' gis' ais' c''2
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % Mode 2: {0,1,3,4,6,7,9,10}
      c'4^\markup { \tiny "Mode 2" } des' ees' e' fis' g' a' bes' c''2
    }
  >>
  \layout { }
}
