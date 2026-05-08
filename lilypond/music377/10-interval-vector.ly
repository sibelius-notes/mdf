\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Interval vector derivation from [3-11] minor triad {0,3,7} = C Eb G
% Dyad pairs: C-Eb = ic3, Eb-G = ic4, C-G = ic5  → iv: [001110]
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 3/4
      % Bar 1: the minor triad as a musical gesture
      c'8 ees'8 g'4~ g'4
      |
      % Bar 2: show each dyad pair with ic label
      <c' ees'>4^\markup { \tiny "ic 3 (m3)" }
      <ees' g'>4^\markup { \tiny "ic 4 (M3)" }
      <c' g'>4^\markup { \tiny "ic 5 (P5)" }
      |
      % Bar 3: full triad chord with iv label
      <c' ees' g'>2^\markup { \small "[3-11]  iv: ⟨001110⟩" }
      r4
    }
  }
  \layout { }
}
