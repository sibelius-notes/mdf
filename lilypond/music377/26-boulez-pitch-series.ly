\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Boulez Structures Ia pitch series (from Messiaen Mode de valeurs)
  % Eb D A Ab G F# E C# C Bb F B
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      ees'4^\markup { \tiny "3" }
      d'4^\markup { \tiny "2" }
      a'4^\markup { \tiny "9" }
      aes'4^\markup { \tiny "8" }
      g'4^\markup { \tiny "7" }
      fis'4^\markup { \tiny "6" }
      e'4^\markup { \tiny "4" }
      des'4^\markup { \tiny "1" }
      c'4^\markup { \tiny "0" }
      bes'4^\markup { \tiny "10" }
      f'4^\markup { \tiny "5" }
      b'4^\markup { \tiny "11" }
    }
  }
  \layout { }
}
