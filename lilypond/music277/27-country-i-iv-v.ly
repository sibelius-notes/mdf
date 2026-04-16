\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { g1 c1 d1 g1 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key g \major \time 4/4
        \omit Score.BarNumber
        % Country I–IV–V–I in G major
        d'1 e'1 fis'1 g'1
      }
      \new Staff {
        \clef bass \key g \major \time 4/4
        \omit Score.BarNumber
        <g, b, d>1 <c e g>1 <d, fis, a,>1 <g, b, d>1
      }
    >>
  >>
  \layout { }
}
