\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Acoustic beating between two close frequencies
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: C4 and C4+2Hz stacked — near-unison beating
      << c'1^\markup { \small "262 Hz" }
         { \once \override NoteHead.color = #grey d'1 } >>^\markup { \small "beat = 2 Hz (slow)" }
      |
      % Bar 2: C4 and D4 — roughness
      << c'1 d'1 >>^\markup { \small "beat = 32 Hz (rough)" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c1_\markup { \small "C4: 262 Hz" }
      |
      c1_\markup { \small "C4 + D4" }
    }
  >>
  \header {
    piece = \markup { \small "Beats: |f2 - f1| = beat frequency" }
  }
  \layout { }
}
