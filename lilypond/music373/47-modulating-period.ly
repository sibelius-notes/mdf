\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 3/4
      \omit Score.BarNumber
      %% Antecedent in G, ends HC
      g'4^"ant. (G)" a'4 b'4 | d''2.^"HC in G" |
      %% Consequent: modulates to D major, ends PAC in D
      g'4^"cons." a'4 b'4 | fis''4^"→ D" e''4 d''4 | d''2.^"PAC in D" \bar "|."
    }
    \new Staff {
      \clef bass \key g \major \time 3/4
      \omit Score.BarNumber
      g,2. | d,2. |
      g,4 g,4 g,4 | a,4 a,4 a,4 | d,2. \bar "|."
    }
  >>
  \layout { }
}
