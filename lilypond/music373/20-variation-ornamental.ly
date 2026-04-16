\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \major \time 3/4
      \omit Score.BarNumber
      %% Variation I: sixteenth-note figuration over same harmony
      cis''16^"Var. I" d'' cis'' d'' e''8 a''4 |
      b'16 cis'' b' cis'' gis'8 a'4^"HC" |
      cis''16 d'' cis'' d'' e''8 a''4 |
      e''16 dis'' e'' fis'' cis''4.^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key a \major \time 3/4
      \omit Score.BarNumber
      a,2. | e,2. | a,2. | a,2. \bar "|."
    }
  >>
  \layout { }
}
