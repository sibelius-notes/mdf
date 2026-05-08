\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Jazz blues scale in C with lick over C7 comping
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \time 4/4 \omit Score.BarNumber
      \once \override Score.RehearsalMark.self-alignment-X = #LEFT
      \mark \markup { \small \italic "Blues scale lick (C)" }
      c'8^\markup { \tiny "blues scale" } ees'8 f'8 fis'8^\markup { \tiny "b5" } g'8 bes'8 c''4~ |
      c''8 bes'8 g'8 fis'8 f'8 ees'8 c'4 |
    }
    \new Staff {
      \clef bass \time 4/4 \omit Score.BarNumber
      <c, e, bes,>1^\markup { \tiny "C7" } |
      <c, e, bes,>1 |
    }
  >>
  \layout { }
}
