\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Four row forms: P0, R0, I0, RI0 — Schoenberg Op.25 row
% P0:  E F G Db F# Eb Ab D B C A Bb
% R0:  Bb A C B D Ab Eb F# Db G F E
% I0:  Ab G F B F# A E Bb Db C Eb D
% RI0: D Eb C Db Bb E A F# B F G Ab
\score {
  \new StaffGroup <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        e'8^\markup { \tiny "P₀ →" }
        f' g' des' fis' ees' aes' d' b' c' a' bes'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        bes'8^\markup { \tiny "R₀ ←" }
        a' c' b' d' aes' ees' fis' des' g' f' e'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        aes'8^\markup { \tiny "I₀ ↓" }
        g' f' b' fis' a' e' bes' des' c' ees' d'
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        d'8^\markup { \tiny "RI₀ ↑" }
        ees' c' des' bes' e' a' fis' b' f' g' aes'
      }
    }
  >>
  \layout { }
}
