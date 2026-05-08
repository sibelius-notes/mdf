\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Interval classes ic1–ic6: each dyad followed by a 1-bar atonal gesture
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 3/4
      % ic1: semitone — chromatic figure
      <c' des'>4^\markup { \tiny "ic 1" }
      c'8 des'8~ des'4
      \bar "||"
      % ic2: whole tone — whole-tone arpeggio figure
      <c' d'>4^\markup { \tiny "ic 2" }
      c'8 d'8~ d'4
      \bar "||"
      % ic3: minor third — minor-third oscillation
      <c' ees'>4^\markup { \tiny "ic 3" }
      ees'8 c'8 ees'4
      \bar "||"
      % ic4: major third — quartal chord arpeggio
      <c' e'>4^\markup { \tiny "ic 4" }
      c'8 e'8 c'4
      \bar "||"
      % ic5: perfect fourth — quartal gesture
      <c' f'>4^\markup { \tiny "ic 5" }
      f'8 c'8~ c'4
      \bar "||"
      % ic6: tritone — tritone split (Webern-style)
      <c' fis'>4^\markup { \tiny "ic 6" }
      fis'8 c'8 r4
      \bar "|."
    }
  }
  \layout { }
}
