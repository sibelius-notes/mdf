\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % T_7 applied to C major triad {0,4,7} -> G major {7,11,2}
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % Original: C major {0,4,7}
      <c' e' g'>1^\markup { \tiny \column { "{0,4,7}" "C major" } }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % T_7: G major {7,11,2}
      <g' b' d''>1^\markup { \tiny \column { "T₇{0,4,7}" "G major" } }
    }
  >>
  \layout { }
}
