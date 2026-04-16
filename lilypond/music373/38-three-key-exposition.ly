\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef bass \key c \major \time 4/4
    \omit Score.BarNumber
    %% Schubertian three-key exposition: I - III - V
    c,2^"P: I (C)" e,2^"→III" |
    e,2^"mid: III (E)" gis,2^"→V" |
    g,2^"S: V (G)" d,2^"EEC" \bar "|."
  }
  \layout { }
}
