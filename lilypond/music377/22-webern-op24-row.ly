\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Webern Op.24 Concerto row: 11 10 2 3 7 6 8 4 5 0 1 9
  % B Bb D Eb G Gb Ab E F C Db A
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      b'8^\markup { \tiny "11" }
      bes'8^\markup { \tiny "10" }
      d''8^\markup { \tiny "2" }
      ees''8^\markup { \tiny "3" }
      \bar "|"
      g''8^\markup { \tiny "7" }
      fis''8^\markup { \tiny "6" }
      aes''8^\markup { \tiny "8" }
      e''8^\markup { \tiny "4" }
      \bar "|"
      f''8^\markup { \tiny "5" }
      c''8^\markup { \tiny "0" }
      des''8^\markup { \tiny "1" }
      a''8^\markup { \tiny "9" }
    }
  }
  \layout { }
}
