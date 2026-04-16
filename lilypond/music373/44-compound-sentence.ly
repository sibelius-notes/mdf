\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Large-scale sentence: 4-bar BI, 4-bar BI', 4-bar continuation, 4-bar cadential
      c''2^"BI (mm.1-4)" g''2 | c''2 e''2 |
      c''2^"BI' (mm.5-8)" g''2 | c''2 e''2 |
      %% Continuation: fragmented
      e''4^"cont." d''4 c''4 b'4 | a'4 g'4 f'4 e'4 |
      d'4 f'4 a'4 c''4 | b'4 d''4 f''4 a''4 |
      %% Cadential
      c''2^"cad." g'2 | b'2 c''2^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 e,2 | c,2 g,2 |
      c,2 e,2 | c,2 g,2 |
      c,4 a,4 f,4 g,4 | f,4 e,4 d,4 c,4 |
      g,4 b,4 d4 f4 | e,4 g,4 b,4 d4 |
      c,2 g,2 | g,2 c,2 \bar "|."
    }
  >>
  \layout { }
}
