\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Presentation: basic idea (mm.1-2) + restatement (mm.3-4)
    c''4^"BI" e''4 d''4 c''4 |
    c''4^"BI'" e''4 d''4 c''4 |
    %% Continuation: fragmentation + harmonic acceleration
    e''8^"cont." d''8 c''8 b'8 a'8 g'8 f'8 e'8 |
    %% Cadential: I6/4 - V7 - I
    c''4.^"I6/4" g'8 b'4^"V7" c''4^"PAC" \bar "|."
  }
  \layout { }
}
