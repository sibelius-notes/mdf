\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Binary form (A–B): two contrasting sections, each repeated
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    \mark \markup { \box "A" }
    \repeat volta 2 {
      c'4 e'4 g'4 e'4 |
      d'4 f'4 a'4 f'4 |
      e'4 g'4 b'4 g'4 |
      d'2 d'2 |
    }
    \mark \markup { \box "B" }
    \repeat volta 2 {
      g'4 a'4 b'4 c''4 |
      b'4 a'4 g'4 f'4 |
      e'4 f'4 g'4 a'4 |
      g'2 g'2 |
    }
  }
  \layout { }
}
