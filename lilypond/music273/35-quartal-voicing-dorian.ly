\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% "So What" quartal voicing: D Dorian
% Bass D, LH: A-D-G, RH: C-F-A
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' f' a'>1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      <d, a, d g>1
    }
  >>
  \layout { }
}
