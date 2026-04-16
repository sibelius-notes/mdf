\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  <<
    \new ChordNames {
      \chordmode { d1:m g1 d1:m a1:m }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Dorian i–IV–i–v: the major IV chord is the Dorian signature
        f'1 g'1 f'1 e'1
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        <d, f a,>1 <g, b, d>1 <d, f a,>1 <a,, c e>1
      }
    >>
  >>
  \layout { }
}
