\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bartók polymodal counterpoint: C Lydian (treble) + C Phrygian (bass)
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % C Lydian: C D E F# G A B C (raised 4th = F#)
  c4^\markup { \small "C Lydian (↑F♯)" } d e fis |
  g4 a b c |
  c4 b a g |
  fis4 e d c |
}
lower = \relative c {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % C Phrygian: C Db Eb F G Ab Bb C (lowered 2nd = Db)
  c4^\markup { \small "C Phrygian (↓D♭)" } des es f |
  g4 as bes c |
  c4 bes as g |
  f4 es des c |
}
\score {
  \new GrandStaff <<
    \new Staff \with {
      \override StaffSymbol.color = #black
    } \upper
    \new Staff \lower
  >>
  \header {
    piece = \markup { \italic "Polymodal: C Lydian + C Phrygian" }
  }
  \layout { }
}
