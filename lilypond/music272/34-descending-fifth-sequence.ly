\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 4/4
      \omit Score.BarNumber
      d''2~ d''4 c'' | b'2~ b'4 a' | a'2~ a'4 g' | g'2~ g'4 fis' | g'1
      \bar "|."
    }
    \new Staff {
      \clef bass \key g \major \time 4/4
      g2 e2 | a,2 fis,2 | d2 b,2 | e2 c2 | d1
      \bar "|."
    }
  >>
  \layout { }
}
