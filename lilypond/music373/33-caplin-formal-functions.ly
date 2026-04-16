\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Beginning function: stable, tight-knit
    c''4^"BEG. fcn." e''4 g''4 e''4 |
    c''4 e''4 g''2 |
    %% Middle function: loose, developmental
    g''8^"MID. fcn." f''8 e''8 d''8 c''8 b'8 a'8 g'8 |
    g'4 b'4 d''4 f''4 |
    %% Ending function: cadential arrival
    c''4^"END. fcn." g'4 b'4 c''2^"PAC" \bar "|."
  }
  \layout { }
}
