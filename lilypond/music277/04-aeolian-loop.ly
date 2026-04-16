\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { a1:m g1 f1 g1 }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key a \minor \time 4/4
        \omit Score.BarNumber
        % Aeolian loop i–VII–VI–VII in A minor
        e'1 d'1 c'1 d'1
      }
      \new Staff {
        \clef bass \key a \minor \time 4/4
        \omit Score.BarNumber
        <a, c e>1 <g, b, d>1 <f, a, c>1 <g, b, d>1
      }
    >>
  >>
  \layout { }
}
