\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Z-related pair: [4-Z15]=(0146) and [4-Z29]=(0137)
  % Both have IV <111111>
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % [4-Z15] (0146): C, Db, E, Gb
      <c' des' e' fis'>1^\markup { \tiny "[4-Z15] (0146)" }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % [4-Z29] (0137): C, Db, Eb, G
      <c' des' ees' g'>1^\markup { \tiny "[4-Z29] (0137)" }
    }
  >>
  \layout { }
}
