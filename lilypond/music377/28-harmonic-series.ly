\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Harmonic series on E2: partials 1-8 (approximate ET pitches)
  % E2, E3, B3, E4, G#4, B4, D5(-31c), E5
  \new Staff \with { \omit KeySignature } {
    \clef bass
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c, {
      e,1^\markup { \tiny "k=1 E₂" }
      e1^\markup { \tiny "k=2 E₃" }
      b1^\markup { \tiny "k=3 B₃" }
      \clef treble
      e'1^\markup { \tiny "k=4 E₄" }
      gis'1^\markup { \tiny "k=5 G♯₄" }
      b'1^\markup { \tiny "k=6 B₄" }
      d''1^\markup { \tiny "k=7 D₅ -31¢" }
      e''1^\markup { \tiny "k=8 E₅" }
    }
  }
  \layout { }
}
