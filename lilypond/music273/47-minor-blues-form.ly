\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Minor blues skeleton in C minor (bars 1-4 shown)
\score {
  <<
    \new ChordNames {
      \chordmode { c1:m7 c1:m7 f1:m7 c1:m7 }
    }
    \new Staff {
      \clef treble \key c \minor \time 4/4
      \omit Score.BarNumber
      c1 c1 f1 c1
    }
  >>
  \layout { }
}
