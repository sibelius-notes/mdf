\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % RICH chain: P0 -> RI10 -> P0 (Webern Op.27 style)
  % P0 starts on 0 (C), ends on 10 (Bb)
  % RI10 starts on 10 (Bb), connects back
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        c'8^\markup { \tiny "P₀ start" } b ees' e' aes' g' a' fis' d' des' f' bes'^\markup { \tiny "P₀ end" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        bes'8^\markup { \tiny "RI₁₀ start" } r r r r r r r r r r c'^\markup { \tiny "RI₁₀ end" }
      }
    }
  >>
  \layout { }
}
