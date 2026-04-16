\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Generic twelve-tone row (all 12 pcs in order)
  % Using Schoenberg Op.25 row: E F G Db F# Eb Ab D B C A Bb
  % integers: 4 5 7 1 6 3 8 2 11 0 9 10
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      e'4^\markup { \tiny "4" }
      f'4^\markup { \tiny "5" }
      g'4^\markup { \tiny "7" }
      des'4^\markup { \tiny "1" }
      fis'4^\markup { \tiny "6" }
      ees'4^\markup { \tiny "3" }
      aes'4^\markup { \tiny "8" }
      d'4^\markup { \tiny "2" }
      b'4^\markup { \tiny "11" }
      c'4^\markup { \tiny "0" }
      a'4^\markup { \tiny "9" }
      bes'4^\markup { \tiny "10" }
    }
  }
  \layout { }
}
