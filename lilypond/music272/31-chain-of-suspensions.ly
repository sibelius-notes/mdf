\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 2/2
      \omit Score.BarNumber
      b'2~ b'2 | a'2~ a'2 | g'2~ g'2 | f'2 e'2
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 2/2
      \override NoteHead.color = #black
      a2 g2 | f2 e2 | d2 c2 | d1
      \bar "|."
    }
  >>
  \layout { }
}
