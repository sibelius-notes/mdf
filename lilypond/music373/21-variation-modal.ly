\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 3/4
      \omit Score.BarNumber
      %% Modal variation: theme in A minor
      c''4^"Var. (minor)" e''4 a''4 |
      b'4 gis'4 a'4^"HC" |
      c''4 e''4 a''4 |
      e''4 cis''2^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key a \minor \time 3/4
      \omit Score.BarNumber
      a,2. | e,2. | a,2. | a,2. \bar "|."
    }
  >>
  \layout { }
}
