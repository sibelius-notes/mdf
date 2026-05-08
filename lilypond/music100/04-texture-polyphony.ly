\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Polyphony: two independent melodic lines
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \once \override Score.RehearsalMark.self-alignment-X = #LEFT
      \mark \markup { \small \italic "Polyphony: two independent voices" }
      e'8 f'8 g'8 a'8 b'8 a'8 g'8 f'8 |
      e'8 d'8 c'8 d'8 e'8 f'8 g'4 |
      a'8 g'8 f'8 e'8 d'8 e'8 f'8 g'8 |
      e'2 c'2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c4 e4 g4 c'4 |
      g,4 b,4 d4 g4 |
      f,4 a,4 c4 f4 |
      c4 g,4 e,2 |
    }
  >>
  \layout { }
}
