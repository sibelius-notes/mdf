\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Basic Idea
      c''4^"BI" e''4 g''2 |
      %% Restatement
      c''4^"BI'" e''4 g''2 |
      %% Continuation (fragmentation)
      g''8^"frag." f''8 e''8 d''8 e''8 d''8 c''8 b'8 |
      %% Cadential
      c''4.^"cad." g'8 b'4 c''4 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 g,2 |
      c,2 g,2 |
      c,4 a,4 f,4 g,4 |
      c,2. c,4 \bar "|."
    }
  >>
  \layout { }
}
