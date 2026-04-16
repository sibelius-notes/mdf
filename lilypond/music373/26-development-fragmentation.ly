\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% Original motive from exposition
    c''4^"motive" e''4 g''2 |
    %% Fragmentation: motive reduced to 2-note cell
    c''8^"frag." e''8 r4 g''8^"seq." b''8 r4 |
    %% Sequential development descending
    e''8^"seq." gis''8 r4 d''8^"seq." fis''8 r4 |
    %% Retransition: dominant pedal
    g'1^"V ped. (retrans.)" \bar "|."
  }
  \layout { }
}
