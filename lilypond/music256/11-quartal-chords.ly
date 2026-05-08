\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Quartal harmony: stacked perfect 4ths (Hindemith/Bartók style)
% Both hands present stacks of 4ths in parallel motion
upper = \relative c' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % 5-note quartal stack on C: C-F-Bb-Eb-Ab, then up a step
  <c f bes ees>2^\markup { \tiny "C–F–B♭–E♭ (stacked 4ths)" }
  <d g c f>2^\markup { \tiny "D–G–C–F" } |
  <e a d g>2^\markup { \tiny "E–A–D–G" }
  <f bes ees aes>2^\markup { \tiny "F–B♭–E♭–A♭" } |
  % Resolution: stepwise descent back to quartal chord on C
  <d g c f>2 <c f bes>2 |
  <c f bes>1~ |
}
lower = \relative c, {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % Bass mirrors with lower quartal stacks
  <c g' d'>2\mf <d a' e'>2 |
  <e b' f'>2 <f c' g'>2 |
  <d a' e'>2 <c g' d'>2 |
  <c g' d'>1~ |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
