\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Classic opera ensemble: 3 staves with different melodic lines simultaneously
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = "Soprano" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Soprano: high, flowing
      c''2\mf e''4 d''4 |
      c''4 b'4 a'2 |
      e''4 d''4 c''4 b'4 |
      c''1 |
    }
    \new Staff \with { instrumentName = "Tenor" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Tenor: middle register, different rhythm
      e'4\mp f'4 g'2 |
      g'4. a'8 g'4 e'4 |
      g'8 a'8 g'4 f'4 e'4 |
      g'1 |
    }
    \new Staff \with { instrumentName = "Bass" } {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Bass: harmonic foundation
      c2\p g,2 |
      a,2 e,2 |
      f,4 g,4 a,4 g,4 |
      c2 c,2 |
    }
  >>
  \layout { }
}
