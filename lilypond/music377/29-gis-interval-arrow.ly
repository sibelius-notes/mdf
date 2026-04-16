\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % GIS: pitch-class GIS showing int(C,G)=7, int(G,D)=7
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      c'1^\markup { \tiny "C (s)" }
      g'1^\markup { \tiny "G (t) int=7" }
      \bar "||"
      g'1^\markup { \tiny "G (s)" }
      d''1^\markup { \tiny "D (t) int=7" }
    }
  }
  \layout { }
}
