\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Lewin GIS: interval function int(C,G) = 7 semitones shown as arrow between two notes
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    c'1^\markup { \small "s" }
    g'1^\markup { \small "t  [int(s,t) = 7]" }
  }
  \layout { }
}
