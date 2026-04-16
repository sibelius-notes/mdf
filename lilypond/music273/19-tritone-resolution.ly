\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tritone B-F in G7 resolves inward to C-E in Cmaj7
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Upper voice: B resolves to C
      b2 c'2
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Lower voice: F resolves to E
      f2 e2
    }
  >>
  \layout { }
}
