\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Klumpenhouwer network: trichord with T and I edges
  % {0,4,7}: C->E (T4), C->G (T7), E->G (T3); plus inversional connections
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      c'1^\markup { \tiny "0: C" }
      e'1^\markup { \tiny "4: E (T₄ from C)" }
      g'1^\markup { \tiny "7: G (T₃ from E)" }
      \bar "||"
      % Isographic K-net: {3,7,10}
      ees'1^\markup { \tiny "3: E♭" }
      g'1^\markup { \tiny "7: G (T₄ from E♭)" }
      bes'1^\markup { \tiny "10: B♭ (T₃ from G)" }
    }
  }
  \layout { }
}
