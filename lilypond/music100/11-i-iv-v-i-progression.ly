\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% I-IV-V-I in C major: melody on top, chords below, walking bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: I
      c''4_\markup { \tiny "I" } e''4 g''4 e''4 |
      % Bar 2: IV
      f''4_\markup { \tiny "IV" } f''4 a''4 f''4 |
      % Bar 3: V
      g''4_\markup { \tiny "V" } b'4 d''4 g''4 |
      % Bar 4: I
      e''2_\markup { \tiny "I" } c''2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      <c g>2 <e g>2 |
      <f a>2 <f a c'>2 |
      <g, b,>2 <g, d>2 |
      <c e>2 c2 |
    }
  >>
  \layout { }
}
