\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Imperfect consonances: M3, m3, M6, m6 in first-species counterpoint
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % CP in treble: imperfect consonances on downbeats
      e'1^\markup { "M3" } |
      a'1^\markup { "M6" } |
      ees'1^\markup { "m3" } |
      aes'1^\markup { "m6" } |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % CF in bass: whole notes
      c1 |
      c1 |
      c1 |
      c1 |
    }
  >>
  \layout { }
}
