\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% P-zone in tonic (recap)
    c''4^"P (I)" e''4 g''2 |
    %% TR (non-modulating in recap)
    c''4^"TR (no mod.)" d''4 e''4 f''4 |
    %% S-zone in tonic (corrected)
    c''4^"S (I - corrected)" e''4 d''4 c''4 |
    %% ESC
    d''4 b'4 c''2^"ESC: I:PAC" \bar "|."
  }
  \layout { }
}
