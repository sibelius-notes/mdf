\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Beethoven Op.131 RL chain: C#min -> E maj -> G#min -> B maj -> D#min -> F# maj
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <cis' e' gis'>2^\markup { \tiny "C♯ min" }
      <e' gis' b'>2^\markup { \tiny "R→E maj" }
      <gis' b' dis''>2^\markup { \tiny "L→G♯ min" }
      <b' dis'' fis''>2^\markup { \tiny "R→B maj" }
      <dis'' fis'' ais''>2^\markup { \tiny "L→D♯ min" }
      <fis'' ais'' cis'''>2^\markup { \tiny "R→F♯ maj" }
    }
  }
  \layout { }
}
