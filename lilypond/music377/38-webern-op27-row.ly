\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Webern Op.27 Piano Variations: palindromic row in canon
% Treble = P0 variant, Bass = RI0 canonic answer
% Op.27 row: 0 11 3 4 8 7 9 6 2 1 5 10
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % P0: C B Eb E Ab G A F# D Db F Bb
        c'8\pp^\markup { \tiny "P₀" }
        b8 ees'8. e'16~ e'8 aes'8 g'4
        |
        a'8 fis'8~ fis'4 d'8 des'8 f'4
        |
        bes'2. r4
        |
        r1
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % RI0 enters offset — Webern canonic style
        r1
        |
        r2
        % RI0 of Op.27 row: reverse T0P = 10 5 1 2 6 9 7 8 4 3 11 0
        bes,8\pp^\markup { \tiny "RI₀" }
        f8
        |
        des8 d8 fis8. g16~ g8 ees8 aes4
        |
        b8 c8~ c2 r4
      }
    }
  >>
  \layout { }
}
