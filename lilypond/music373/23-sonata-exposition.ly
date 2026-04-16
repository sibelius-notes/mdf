\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% P-zone: sentence in C major
    c''4^"P (I)" e''4 g''2 | c''4 e''4 g''2 |
    g''8 f''8 e''8 d''8 c''8 b'8 a'8 g'8 |
    c''4 g'4 b'4 c''4^"PAC" |
    %% TR: loosening, drive to MC
    c''4^"TR" d''4 e''4 f''4 |
    g''4 a''4 b''4^"V:HC MC" r4 |
    %% S-zone: period in G major
    d''4^"S (V)" f''4 e''4 d''4 |
    e''4 c''4 d''2^"EEC: V:PAC" \bar "|."
  }
  \layout { }
}
