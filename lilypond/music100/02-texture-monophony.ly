\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Monophony: single unaccompanied melodic line
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    \once \override Score.RehearsalMark.self-alignment-X = #LEFT
    \mark \markup { \small \italic "Monophony: single melodic line" }
    c'4 d'4 e'4 f'4 |
    g'4 f'4 e'4 d'4 |
    e'4 g'4 c''4 b'4 |
    a'2 g'2 |
  }
  \layout { }
}
