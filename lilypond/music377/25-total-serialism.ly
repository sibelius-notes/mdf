\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Total serialism: pitch series with proportional duration series
  % Boulez Structures Ia pitch series: Eb D A Ab G F# E C# C Bb F B
  % (integers 3 2 9 8 7 6 4 1 0 10 5 11)
  % Duration series: 1=32nd through 12=dotted quarter (scaled)
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \time 12/4
    \relative c'' {
      ees'32^\markup { \tiny "d=1" }
      d'16^\markup { \tiny "d=2" }
      a'16.^\markup { \tiny "d=3" }
      aes'8^\markup { \tiny "d=4" }
      g'8.^\markup { \tiny "d=5" }
      fis'4^\markup { \tiny "d=6" }
      e'4.^\markup { \tiny "d=7" }
      des'2^\markup { \tiny "d=8" }
    }
  }
  \layout { }
}
