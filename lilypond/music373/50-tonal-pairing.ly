\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    %% Schubertian tonal pairing: I and VI (C and Ab)
    c,1^"I (C)" |
    aes,,1^"VI (Ab) - third related" |
    c,1^"I return" \bar "|."
  }
  \layout { }
}
