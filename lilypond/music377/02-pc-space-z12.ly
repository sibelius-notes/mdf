\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Z₁₂ pitch-class space: registral ascent through all 12 PCs
% Schoenberg-style free atonality — each PC labeled with clock integer
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      \time 4/4
      c'8^\markup { \tiny "0" }
      des'8^\markup { \tiny "1" }
      d'8^\markup { \tiny "2" }
      ees'8^\markup { \tiny "3" }
      r4 r4
      |
      e'8^\markup { \tiny "4" }
      f'8^\markup { \tiny "5" }
      fis'8^\markup { \tiny "6" }
      g'8^\markup { \tiny "7" }
      r4 r4
      |
      aes'8^\markup { \tiny "8" }
      a'8^\markup { \tiny "9" }
      bes'8^\markup { \tiny "10" }
      b'8^\markup { \tiny "11" }
      r4 r4
      |
      c''2^\markup { \small "pc 0 = pc 12 (mod 12)" }
      r2
    }
  }
  \layout { }
}
