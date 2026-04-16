\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Schoenberg Op.11 No.1 opening motto: {7,8,11} = G, G#, B = [3-3] (014)
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      % Opening right-hand melody: B G# G (pcs 11, 8, 7)
      b'4^\markup { \tiny "B (11)" }
      gis'4^\markup { \tiny "G♯ (8)" }
      g'4^\markup { \tiny "G (7)" }
      r4
      \bar "||"
      % Set as chord
      <g' gis' b'>1^\markup { \tiny "{7,8,11} = [3-3] (014)" }
    }
  }
  \layout { }
}
