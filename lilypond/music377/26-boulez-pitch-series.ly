\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Boulez Structures Ia: pitch series as melody + rhythmic series on 2nd staff
% Pitch series (from Messiaen Mode de valeurs): Eb D A Ab G F# E C# C Bb F B
% Duration series: 1 2 3 4 5 6 7 8 9 10 11 12 (×32nd)
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % Pitch series in quarter/eighth rhythms (simplified for legibility)
        ees'4^\markup { \tiny "Eb (3)" }
        d'4^\markup { \tiny "D (2)" }
        a'8^\markup { \tiny "A (9)" }
        aes'8^\markup { \tiny "A♭ (8)" }
        g'4^\markup { \tiny "G (7)" }
        |
        fis'4^\markup { \tiny "F♯ (6)" }
        e'8^\markup { \tiny "E (4)" }
        des'8^\markup { \tiny "C♯ (1)" }
        c'4^\markup { \tiny "C (0)" }
        r4
        |
        bes'4^\markup { \tiny "B♭ (10)" }
        f'4^\markup { \tiny "F (5)" }
        b'2^\markup { \tiny "B (11)" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef percussion
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c' {
        \time 4/4
        % Duration series 1–8 in 32nds (d=1 through d=8)
        c32^\markup { \tiny "d=1" }
        c16^\markup { \tiny "d=2" }
        c16.^\markup { \tiny "d=3" }
        c8^\markup { \tiny "d=4" }
        c8.^\markup { \tiny "d=5" }
        c4^\markup { \tiny "d=6" }
        c4.^\markup { \tiny "d=7" }
        r8
        |
        c2^\markup { \tiny "d=8" }
        r2^\markup { \small "rhythmic series (×32nd)" }
      }
    }
  >>
  \layout { }
}
