\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key d \minor \time 4/4
    \omit Score.BarNumber
    %% Chaconne ostinato: D minor I-IV-V-I (4-bar cycle)
    d,1^"I (d)" |
    g,1^"IV" |
    a,1^"V" |
    d,1^"I" \bar "||"
    %% Repeat of bass line (variation implied)
    d,1^"Var. 2" |
    g,1 |
    a,1 |
    d,1 \bar "|."
  }
  \layout { }
}
