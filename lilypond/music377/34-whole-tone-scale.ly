\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Whole-tone scale {0,2,4,6,8,10}: symmetrical collection
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      c'4 d'4 e'4 fis'4 gis'4 ais'4 c''2
      \bar "||"
      % As chord
      <c' d' e' fis' gis' ais'>1^\markup { \tiny "{0,2,4,6,8,10} [6-35]" }
    }
  }
  \layout { }
}
