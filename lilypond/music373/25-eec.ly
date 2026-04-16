\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 4/4
      \omit Score.BarNumber
      %% S-zone material in G major approaching EEC
      b'4^"S (V)" d''4 g''4 f''4 |
      e''4^"pre-dom." c''4 d''2^"EEC: V:PAC" |
      %% C-zone: closing material
      g''4^"C-zone" g''4 g''4 r4 |
      g''2.^"confirming V" r4 \bar "|."
    }
    \new Staff {
      \clef bass \key g \major \time 4/4
      \omit Score.BarNumber
      g,4 b,4 d4 d4 |
      c4 a,4 d2 |
      g,4 g,4 g,4 r4 |
      g,2. r4 \bar "|."
    }
  >>
  \layout { }
}
