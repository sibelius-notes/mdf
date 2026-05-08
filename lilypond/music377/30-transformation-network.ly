\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Transformation network: T₀ → T₃ → T₆ → T₉ (diminished 7th cycle)
% Each node = 1-bar fragment; labels connect transformations
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 4/4
      % Node A: T₀ = {0,3,6,9} = C Eb F# A (dim7)
      c'8^\markup { \tiny "A: T₀{0,3,6,9}" }
      ees'8 fis'4 a'4 r4
      \bar "||"
      % Node B: T₃ = {3,6,9,0} — same set! (dim7 invariant under T₃)
      ees'8^\markup { \tiny "B: T₃→{3,6,9,0}" }
      fis'8 a'4 c''4 r4
      \bar "||"
      % Node C: T₆ = {6,9,0,3}
      fis'8^\markup { \tiny "C: T₆→{6,9,0,3}" }
      a'8 c''4 ees''4 r4
      \bar "||"
      % Node D: T₉ = {9,0,3,6} — cycle complete
      a'8^\markup { \tiny "D: T₉→{9,0,3,6}" }
      c''8 ees''4 fis''4 r4
      \bar "|."
    }
  }
  \layout { }
}
