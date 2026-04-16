\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Compound Basic Idea: BI (m1-2) + CI (m3-4), no cadence
      c''4^"BI" e''4 g''2 |
      a''4^"CI" g''4 f''4 e''4 |
      %% Continuation
      e''8^"cont." d''8 c''8 b'8 a'8 g'8 f'8 e'8 |
      c''4^"cad." g'4 b'4 c''4^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,2 e,2 |
      f,2 c,2 |
      c,4 d,4 e,4 f,4 |
      c,2 g,4 c,4 \bar "|."
    }
  >>
  \layout { }
}
