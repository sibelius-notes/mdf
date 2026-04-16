\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Complement pairs: {0,4,7} (C major triad) and its complement (9 pcs)
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % S = {0,4,7}: C E G
      <c' e' g'>1^\markup { \tiny "S = {0,4,7}" }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % S-complement = {1,2,3,5,6,8,9,10,11}: Db D Eb F Gb Ab A Bb B
      <des, d, ees, f, fis, aes, a, bes, b,>1^\markup { \tiny "S̄ = complement" }
    }
  >>
  \layout { }
}
