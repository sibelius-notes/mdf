\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Op.11 No.1: four (014) statements at T7, T4, T9, T7I
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      % T7(014) = {7,8,11}: G Ab B
      <g' gis' b'>1^\markup { \tiny "T₇(014)" }
      % T4(014) = {4,5,8}: E F Ab
      <e' f' aes'>1^\markup { \tiny "T₄(014)" }
      % T9(014) = {9,10,1}: A Bb Db
      <a' bes' des''>1^\markup { \tiny "T₉(014)" }
      % T3I(014) = {3,2,11}={11,2,3}: B D Eb
      <b' d'' ees''>1^\markup { \tiny "T₃I(014)" }
    }
  }
  \layout { }
}
