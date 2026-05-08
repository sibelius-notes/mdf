\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% T₂ applied to Schoenberg Op.11 motto {7,8,11} = G-G#-B → {9,10,1} = A-Bb-C#
% Treble = original figure, Bass = T₂ version
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 2/4
        % Original motto G-G#-B  {7,8,11}
        g'4^\markup { \tiny "G (7)" }
        gis'4^\markup { \tiny "G♯ (8)" }
        |
        b'2^\markup { \tiny "B (11)  {7,8,11}" }
        |
        r2
        |
        r2
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 2/4
        r2
        |
        r2
        |
        % T₂ version A-Bb-C#  {9,10,1}
        a'4^\markup { \tiny "A (9)" }
        bes'4^\markup { \tiny "B♭ (10)" }
        |
        cis''2^\markup { \tiny "C♯ (1)  T₂{7,8,11}" }
      }
    }
  >>
  \layout { }
}
