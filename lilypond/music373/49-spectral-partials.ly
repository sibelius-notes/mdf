\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    %% Grisey Partiels: overtone series accumulation on low E
    e,,1^"fund. E" \bar "||"
    << { e,1^"oct. 2" } \\ { e,,1 } >> \bar "||"
    << { b,1^"P5 (3rd)" } \\ { e,,1 } \\ { e,1 } >> \bar "|."
  }
  \layout { }
}
