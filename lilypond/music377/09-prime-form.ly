\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Prime form (0 1 5 8) for {2,3,7,10}
  % Show: original set, transposed to 0
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % Normal form [2,3,7,10]: D Eb G Bb
      <d' ees' g' bes'>1^\markup { \tiny "Normal form [2,3,7,10]" }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % Transposed to start on 0: [0,1,5,8] = C Db F Ab
      <c' des' f' aes'>1^\markup { \tiny "Prime form (0 1 5 8)" }
    }
  >>
  \layout { }
}
