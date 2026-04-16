\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % P0 and I0 of Op.25 row on two staves
  % P0: 4 5 7 1 6 3 8 2 11 0 9 10
  % I0: 0-4=8, 0-5=7, 0-7=5, 0-1=11, 0-6=6, 0-3=9, 0-8=4, 0-2=10, 0-11=1, 0-0=0, 0-9=3, 0-10=2
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        e'8^\markup { \tiny "P₀" } f' g' des' fis' ees' aes' d' b' c' a' bes'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        aes'8^\markup { \tiny "I₀" } g' f' b' fis' a' e' bes' des' c' ees' d'
      }
    }
  >>
  \layout { }
}
