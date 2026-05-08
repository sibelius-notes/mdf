\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

upper = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Bar 1-2: held semitone dyad
  <c cis>1^\markup { \tiny "C5+C#5 (523–554 Hz)" } |
  <c cis>1 |
  % Bar 3-4: 8th-note tremolo suggesting beating
  \repeat tremolo 8 { c16 cis16 }^\markup { \tiny "tremolo: beat ~31 Hz" }
  \repeat tremolo 8 { c16 cis16 }
}

lower = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  <c cis>1_\markup { \tiny "C4+C#4 (262–277 Hz)" } |
  <c cis>1 |
  \repeat tremolo 8 { c16 cis16 }_\markup { \tiny "beats ≈ |262 − 277| = 15 Hz" }
  \repeat tremolo 8 { c16 cis16 }
}

\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \header { piece = \markup { \bold "Beating: Semitone Pairs" } }
  \layout { }
}
