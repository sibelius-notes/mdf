\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Bartok Music for Strings fugue subject: chromatic-fifths wedge opening
  % Starting on A(9): 9,10,8,11,7,0 (first 6 notes)
  \new Staff \with { \omit KeySignature } {
    \clef alto
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      a4^\markup { \tiny "A" }
      bes4^\markup { \tiny "B♭" }
      aes4^\markup { \tiny "A♭" }
      b4^\markup { \tiny "B" }
      g4^\markup { \tiny "G" }
      c'4^\markup { \tiny "C" }
      r2
    }
  }
  \layout { }
}
