\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Webern Symphony Op.21 row (also used in Variations Op.27 analysis)
  % P0: 0 11 3 4 8 7 9 6 2 1 5 10
  % C B Eb E Ab G A F# D Db F Bb
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      c'8^\markup { \tiny "0" }
      b8^\markup { \tiny "11" }
      ees'8^\markup { \tiny "3" }
      e'8^\markup { \tiny "4" }
      \bar "|"
      aes'8^\markup { \tiny "8" }
      g'8^\markup { \tiny "7" }
      a'8^\markup { \tiny "9" }
      fis'8^\markup { \tiny "6" }
      \bar "|"
      d'8^\markup { \tiny "2" }
      des'8^\markup { \tiny "1" }
      f'8^\markup { \tiny "5" }
      bes'8^\markup { \tiny "10" }
    }
  }
  \layout { }
}
