\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Basso continuo realization with figured bass"
}

\score {
  <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      ^ \markup { \italic "melody" }
      e'4 f'4 g'4 a'4 |
      g'4 f'4 e'4 d'4 |
      c'2 b4 c'4 |
      c'1 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "continuo" }
      c2 a,2 |
      f2 g2 |
      c2 g,2 |
      c1 |
    }
    \new FiguredBass {
      \figuremode {
        <5 3>2 <6>2 |
        <6>2 <5 3>2 |
        <6 4>2 <5 3>2 |
        <5 3>1 |
      }
    }
  >>
  \layout { }
}
