\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G Lydian dominant scale (mode 4 of D melodic minor): G A B C# D E F
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    g4 a b cis' d' e' f' g'
  }
  \layout { }
}
