\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% K-net: two [3-3] sets related by T₂
% Set A = {11,7,8} = B G G# on treble; Set B = {1,9,10} = Db A Bb on bass
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c''' {
        \time 3/4
        % Set A: B G G#  {11,7,8}  [3-3]
        b'4^\markup { \tiny "B (11)" }
        g'4^\markup { \tiny "G (7)" }
        gis'4^\markup { \tiny "G♯ (8)" }
        |
        <b' g' gis'>2.^\markup { \small "Set A  [3-3]  T₂ ↓" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Set B: Db A Bb  {1,9,10}  [3-3]  T₂ of Set A
        des'4^\markup { \tiny "D♭ (1)" }
        a'4^\markup { \tiny "A (9)" }
        bes'4^\markup { \tiny "B♭ (10)" }
        |
        <des' a' bes'>2.^\markup { \small "Set B = T₂(A)  [3-3]" }
      }
    }
  >>
  \layout { }
}
