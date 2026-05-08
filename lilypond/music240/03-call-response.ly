\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Call-and-response texture
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \mark \markup { \small \italic "Call" }
      g'4 a'4 b'4 c''4 |
      r1 |
      \mark \markup { \small \italic "Call (repeat)" }
      g'4 a'4 b'4 c''4 |
      r1 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      r1 |
      \mark \markup { \small \italic "Response" }
      c4 d4 e4 g4 |
      r1 |
      \mark \markup { \small \italic "Response" }
      c4 e4 g2 |
    }
  >>
  \layout { }
}
