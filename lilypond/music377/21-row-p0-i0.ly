\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% P0 and I0 of Schoenberg Op.25 row — aligned vertically to show inversion pairs
% P0: 4 5 7 1 6 3 8 2 11 0 9 10
% I0: 8 7 5 11 6 9 4 10 1 0 3 2
% Each vertical pair sums to 0 (mod 12)
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 6/4
        % P0 row in eighth notes
        e'8^\markup { \tiny "P₀" }
        f' g' des' fis' ees'
        aes' d' b' c' a' bes'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 6/4
        % I0 row: inversion around C (pc 0)
        aes'8^\markup { \tiny "I₀  (T₀I)" }
        g' f' b' fis' a'
        e' bes' des' c' ees' d'
      }
    }
  >>
  \layout { }
}
