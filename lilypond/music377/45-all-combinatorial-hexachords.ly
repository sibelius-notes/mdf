\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Babbitt's six all-combinatorial hexachords
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      % [6-1] (012345): C Db D Eb E F
      <c' des' d' ees' e' f'>1^\markup { \tiny "[6-1] (012345)" }
      % [6-7] (012678): C Db D F# G Ab
      <c' des' d' fis' g' aes'>1^\markup { \tiny "[6-7] (012678)" }
      % [6-20] (014589): C Db E F Ab A
      <c' des' e' f' aes' a'>1^\markup { \tiny "[6-20] (014589)" }
      % [6-35] (02468A): whole-tone
      <c' d' e' fis' gis' ais'>1^\markup { \tiny "[6-35] whole-tone" }
    }
  }
  \layout { }
}
