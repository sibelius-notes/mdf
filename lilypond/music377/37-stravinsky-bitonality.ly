\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Stravinsky "Augurs of Spring": Eb major triad over E dominant 7th
  % Eb major: {3,7,10} = Eb,G,Bb; E dom7: {4,8,11,2} = E,G#,B,D
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % Eb major (upper voices)
      <ees'' g'' bes''>2.^\markup { \tiny "E♭ major" } r4
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      % E dominant 7th (lower voices)
      <e, gis, b, d>2.^\markup { \tiny "E dom 7th" } r4
    }
  >>
  \layout { }
}
