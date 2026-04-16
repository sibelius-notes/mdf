\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % T_0I applied to C major {0,4,7} -> F minor {0,5,8}
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      <c' e' g'>1^\markup { \tiny \column { "{0,4,7}" "C major" } }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % T_0I: {0,8,5} = {0,5,8} = C,F,Ab = F minor
      <c' f' aes'>1^\markup { \tiny \column { "T₀I{0,4,7}" "F minor" } }
    }
  >>
  \layout { }
}
