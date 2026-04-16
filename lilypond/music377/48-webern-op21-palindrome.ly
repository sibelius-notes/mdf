\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Webern Op.21 row palindrome: P0 and R6 (tritone retrograde) compared
  % P0: 0 11 3 4 8 7 9 6 2 1 5 10
  % R6: reverse of T6(P0) = T6 applied then retrograde
  % T6P0: 6 5 9 10 2 1 3 0 8 7 11 4
  % R6: 4 11 7 8 0 3 1 2 10 9 5 6
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        c'8^\markup { \tiny "P₀" } b ees' e' aes' g' a' fis' d' des' f' bes'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        e'8^\markup { \tiny "R₆" } b' g' aes' ees' des' d' a' fis' aes' f' ges'
      }
    }
  >>
  \layout { }
}
