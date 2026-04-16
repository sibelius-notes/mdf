\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Guido d'Arezzo: four-line staff with approximate square notes (Gregorian-style melody)
\score {
  \new Staff {
    \clef "petrucci-c1"
    \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    c'4 d'4 e'4 f'4 e'4 d'4 c'4
    \bar "|."
  }
  \layout { }
}
