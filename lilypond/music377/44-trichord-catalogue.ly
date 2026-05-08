\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Six most-used trichord classes shown as 1-bar rhythmic gestures
% [3-1] chromatic cluster, [3-3] (014), [3-4] (015), [3-5] (016), [3-7] (025), [3-11] minor triad
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 3/4
      % [3-1] (012): chromatic cluster — appoggiatura approach
      des'8^\markup { \tiny "[3-1] (012)" }
      c'8 cis'4 r4
      \bar "||"
      % [3-3] (014): m2 + M3 — Schoenberg-style
      c'8^\markup { \tiny "[3-3] (014)" }
      des'8 e'4 r4
      \bar "||"
      % [3-4] (015): m2 + P4 — quartal with semitone
      c'8^\markup { \tiny "[3-4] (015)" }
      des'8 f'4 r4
      \bar "||"
      % [3-5] (016): tritone + semitone — Webern split
      c'8^\markup { \tiny "[3-5] (016)" }
      des'8 fis'4 r4
      \bar "||"
      % [3-7] (025): P4 + M2 — quartal gesture
      c'8^\markup { \tiny "[3-7] (025)" }
      d'8 f'4 r4
      \bar "||"
      % [3-11] (037): minor triad — triadic gesture
      c'8^\markup { \tiny "[3-11] (037)" }
      ees'8 g'4 r4
      \bar "|."
    }
  }
  \layout { }
}
