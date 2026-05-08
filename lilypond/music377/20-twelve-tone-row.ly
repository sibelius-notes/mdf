\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schoenberg Op.25 Prelude opening: row as right-hand melody, retrograde in left hand
% Row P0: E-F-G-Db-F#-Eb-Ab-D-B-C-A-Bb  (pcs: 4 5 7 1 6 3 8 2 11 0 9 10)
% R0 (retrograde): Bb-A-C-B-D-Ab-Eb-F#-Db-G-F-E
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % Bar 1: P0 row first hexachord — right hand melody
        e'8^\markup { \tiny "P₀:" }
        f'8 g'4 des'8 fis'8~ fis'4
        |
        % Bar 2: P0 second hexachord
        ees'8 aes'8 d'4 b'8 c'8 a'4
        |
        % Bar 3: P0 concludes
        bes'2\pp r2
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
        % Bars 1-2: rest while treble introduces row
        r1
        |
        r1
        |
        % Bar 3: R0 enters in bass (retrograde of P0)
        bes,8^\markup { \tiny "R₀:" }
        a,8 c4 b,8 d8~ d4
        |
        % Bar 4: R0 continuing
        aes,8 ees8 fis,4 des8 g,8 f,4
      }
    }
  >>
  \layout { }
}
