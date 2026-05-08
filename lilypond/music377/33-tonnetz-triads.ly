\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tonnetz: E major and its PLR neighbors, each as voiced chord on GrandStaff
% E major, P→E minor, L→C# minor, R→B major
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % E major: E G# B  (Tonnetz center)
        <e' gis' b'>2^\markup { \tiny "E maj  (center)" }
        <e' g' b'>2^\markup { \tiny "P: E min" }
        |
        <cis' e' gis'>2^\markup { \tiny "L: C♯ min" }
        <b dis'' fis''>2^\markup { \tiny "R: B maj" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % Bass roots: E, E, C#, B
        e2^\markup { \tiny "root E" }
        e2^\markup { \tiny "root E" }
        |
        cis2^\markup { \tiny "root C♯" }
        b2^\markup { \tiny "root B" }
      }
    }
  >>
  \layout { }
}
