\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Homophony: melody + block chord accompaniment
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \once \override Score.RehearsalMark.self-alignment-X = #LEFT
      \mark \markup { \small \italic "Homophony: melody + chordal support" }
      c'4 d'4 e'4 f'4 |
      g'4 f'4 e'4 d'4 |
      e'4 g'4 c''4 b'4 |
      a'2 g'2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      <c e g>1^\markup { \tiny "I" } |
      <f a c'>1^\markup { \tiny "IV" } |
      <g b d'>1^\markup { \tiny "V" } |
      <c e g>1^\markup { \tiny "I" } |
    }
  >>
  \layout { }
}
