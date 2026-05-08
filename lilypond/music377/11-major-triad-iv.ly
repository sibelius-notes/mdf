\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Major and minor triad share iv [001110] — shown in Scriabin-style voice leading
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 3/4
      % Bar 1: label the major triad dyads
      <c' e'>4^\markup { \tiny "ic 4 (M3)" }
      <e' g'>4^\markup { \tiny "ic 3 (m3)" }
      <c' g'>4^\markup { \tiny "ic 5 (P5)" }
      |
      % Bar 2: C major chord labeled
      <c' e' g'>2^\markup { \tiny "C maj {0,4,7}  iv ⟨001110⟩" }
      r4
      |
      % Bar 3: C minor (same iv — Scriabin-style voice leading passage)
      c'8^\markup { \tiny "C min {0,3,7}" }
      ees'8 g'4~ g'4
      |
      % Bar 4: Scriabin-style chromatic voice-leading: C maj → C min → C maj
      <c' e' g'>4 <c' ees' g'>4 <c' e' g'>4
      |
      % Bar 5: both sets labeled — same iv
      <c' e' g'>2^\markup { \tiny "same iv: ⟨001110⟩" }
      r4
    }
  }
  \layout { }
}
