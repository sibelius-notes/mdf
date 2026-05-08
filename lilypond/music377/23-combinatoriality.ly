\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Combinatoriality: P0 hex1 + I5 hex1 = complete aggregate
% P0 hex1: {4,5,7,1,6,3} = E F G Db F# Eb  (pcs 1,3,4,5,6,7)
% I5 hex1: {1,0,10,4,11,2} = Db C Bb E B D  (pcs 0,2,9,10,11 + remaining)
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % P0 first hexachord
        e'8^\markup { \tiny "P₀ hex 1: {1,3,4,5,6,7}" }
        f'8 g'4 des'4
        |
        fis'4 ees'4 r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % I5 first hexachord — complement of P0 hex1
        des'8^\markup { \tiny "I₅ hex 1: {0,2,9,10,11}+B" }
        c'8 bes4 e'4
        |
        b'4 d'4 r4^\markup { \small "aggregate ✓" }
      }
    }
  >>
  \layout { }
}
