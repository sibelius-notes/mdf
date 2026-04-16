\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Hexatonic collection {0,3,4,7,8,11}: [6-20] (014589)
  % Northern hexatonic system triads
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % Scale
      c'4 ees'4 e'4 g'4 gis'4 b'4 c''2
      \bar "||"
      % As chord
      <c' ees' e' g' gis' b'>1^\markup { \tiny "{0,3,4,7,8,11} [6-20]" }
    }
  }
  \layout { }
}
