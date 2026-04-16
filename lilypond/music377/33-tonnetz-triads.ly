\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Tonnetz: show E major and its three neighbors (P, L, R)
  % E major {4,8,11} = E G# B
  % P: E minor {4,7,11} = E G B
  % L: C# minor {1,4,8} = C# E G#
  % R: C# major {1,5,8} -> actually {4,8,1}={1,4,8}=C#,E,G# = C#min; use R formula
  % R{4,8,11}: move root up by M2: {4+9,8,11}={1,8,11}=C#,G#,B = C# minor?
  % Using formula R{r,r+4,r+7}={r+4,r+7,r+9}: {8,11,1} = G#,B,C# = C# minor
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <e' gis' b'>1^\markup { \tiny "E major" }
      <e' g' b'>1^\markup { \tiny "P: E minor" }
      <cis' e' gis'>1^\markup { \tiny "L: C♯ minor" }
      <gis' b' cis''>1^\markup { \tiny "R: C♯ minor" }
    }
  }
  \layout { }
}
