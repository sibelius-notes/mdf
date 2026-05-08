\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Four cadence types: PAC, IAC, HC, DC — each 2 bars in C major
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      % PAC: soprano ends on tonic, V-I
      d'4_\markup { \tiny "V" } e'4 c'4 |
      c'2._\markup { \tiny "PAC" } |
      % IAC: soprano ends on 3rd (mediant), V-I
      d'4_\markup { \tiny "V" } g'4 e'4 |
      e'2._\markup { \tiny "IAC" } |
      % HC: ends on V chord
      e'4_\markup { \tiny "I" } f'4 g'4 |
      g'2._\markup { \tiny "HC" } |
      % DC: deceptive, V-vi
      g'4_\markup { \tiny "V" } g'4 a'4 |
      a'2._\markup { \tiny "DC" } |
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      <g, b,>2 <c e>4 |
      <c e g>2. |
      <g, b,>2 <c e>4 |
      <c e g>2. |
      <c e>2 <g, b, d>4 |
      <g, b, d>2. |
      <g, b, d>2 <a, c e>4 |
      <a, c e>2. |
    }
  >>
  \layout { }
}
