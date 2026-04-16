\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Falling-fifth sequence through tonal areas
      c''4^"C: I" e''4 g''4 e''4 |
      f'4^"F: IV" a'4 c''4 a'4 |
      b'4^"G: V" d''4 g''4 d''4 |
      e'4^"e: i" gis'4 b'4 gis'4 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 g,2 |
      f,2 c,2 |
      g,2 d,2 |
      e,2 b,,2 \bar "|."
    }
  >>
  \layout { }
}
