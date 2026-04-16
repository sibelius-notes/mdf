\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Combinatoriality: P0 first hexachord + I5 first hexachord = aggregate
  % Op.25 P0 hex1: {4,5,7,1,6,3} = E F G Db F# Eb
  % I5 hex1: 5-{4,5,7,1,6,3} = {1,0,10,4,11,2} = Db C Bb E B D
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        e'8^\markup { \tiny "P₀ hex 1" } f' g' des' fis' ees'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        des'8^\markup { \tiny "I₅ hex 1" } c' bes' e' b' d'
      }
    }
  >>
  \layout { }
}
