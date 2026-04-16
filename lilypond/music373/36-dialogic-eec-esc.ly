\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key g \major \time 4/4
    \omit Score.BarNumber
    %% S-zone: failed EEC attempt, then true EEC
    d''4^"S: attempt 1" fis''4 g''2 |
    c''4^"back to S" e''4 g''2^"failed EEC" |
    d''4^"attempt 2" c''4 b'4 a'4 |
    d''2^"true EEC" r2 |
    %% Recapitulation: same S now in tonic → ESC
    g'4^"Recap S (I)" b'4 d''2 |
    c''4 a'4 g'2^"ESC" \bar "|."
  }
  \layout { }
}
