\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Figured bass notation: bass line with figures 5/3, 6/3, 6/4, 7
\score {
  <<
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2 e2 g2 g,2
    }
    \new FiguredBass {
      \figuremode {
        <5 3>2 <6 3>2 <6 4>2 <7>2
      }
    }
  >>
  \layout { }
}
