\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bartók Music for Strings, Percussion and Celesta (1936) — fugue subject (Mvt. I).
% Chromatic wedge expanding from A: alternates +1/−1, +2/−2, +3/−3 semitones,
% completing the 12-note aggregate: A Bb Ab B G C F# Db F D E Eb.
\score {
  \new Staff \with { \omit KeySignature } {
    \clef alto
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      \time 4/4
      % Bar 1: A (start) → Bb (+1) → Ab (−1) → B (+2)
      a4(^\markup { \tiny "A  ↑1" }
      bes4^\markup { \tiny "Bb ↓1" }
      aes4^\markup { \tiny "Ab ↑2" }
      b4^\markup { \tiny "B" } |
      % Bar 2: G (−2) → C (+3) → F# (−3)
      g4^\markup { \tiny "G  ↑3" }
      c'4^\markup { \tiny "C  ↓3" }
      fis4^\markup { \tiny "F♯" }
      r4 |
      % Bar 3: Db (+4) → F (−4) → D (+5)
      des'4^\markup { \tiny "D♭ ↓4" }
      f4^\markup { \tiny "F  ↑5" }
      d'4^\markup { \tiny "D" }
      r4 |
      % Bar 4: E (−5) → Eb (tritone ±6) — wedge closes
      e'4^\markup { \tiny "E  ±6" }
      ees'2^\markup { \tiny "E♭" }
      r4) |
    }
  }
  \layout { }
}
