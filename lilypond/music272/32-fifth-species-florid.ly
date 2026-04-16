\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      a'2 f'4 g' | a'2~ a'4 g' | f'2 e'4 d' | cis'2. d'4
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      d1 | c1 | bes,1 | a,1
      \bar "|."
    }
  >>
  \layout { }
}
