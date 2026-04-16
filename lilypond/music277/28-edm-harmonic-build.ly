\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 4/4
      \omit Score.BarNumber
      % Static tonic vamp with rising melodic tension
      \mark "Tonic vamp"
      a'1 | a'1 |
      \mark "Rising"
      a'2 b'2 | c''2 d''2 |
      \mark "Peak"
      e''1 | e''1 |
    }
    \new Staff {
      \clef bass \key a \minor \time 4/4
      \omit Score.BarNumber
      <a, c e>1 | <a, c e>1 |
      <a, c e>1 | <a, c e>1 |
      <a, c e>1 | <a, c e>1 |
    }
  >>
  \layout { }
}
