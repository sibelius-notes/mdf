\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % P0 and R0 (retrograde) of Op.25 row
  % P0: 4 5 7 1 6 3 8 2 11 0 9 10
  % R0: 10 9 0 11 2 8 3 6 1 7 5 4
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
        bes'8^\markup { \tiny "R₀" } a' c' b' d' aes' ees' fis' des' g' f' e'
      }
    }
  >>
  \layout { }
}
