\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven Waldstein Op.53 opening: repeated chord texture + bass arpeggio
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2 \omit Score.BarNumber
      \tempo "Allegro con brio"
      % Repeated chord pulsing texture (treble)
      <c' e' g'>8\p <c' e' g'>8 <c' e' g'>8 <c' e' g'>8
        <c' e' g'>8 <c' e' g'>8 <c' e' g'>8 <c' e' g'>8 |
      <b, e' g'>8 <b, e' g'>8 <b, e' g'>8 <b, e' g'>8
        <b, e' g'>8 <b, e' g'>8 <b, e' g'>8 <b, e' g'>8 |
      <a, e' a'>8 <a, e' a'>8 <a, e' a'>8 <a, e' a'>8
        <a, e' c''>8 <a, e' c''>8 <a, e' c''>8 <a, e' c''>8 |
      <g, d' b'>8 <g, d' b'>8 <g, d' b'>8 <g, d' b'>8
        <g, d' g'>8 <g, d' g'>8 <g, d' g'>8 <g, d' g'>8 |
    }
    \new Staff {
      \clef bass \key c \major \time 2/2 \omit Score.BarNumber
      % Bass with rapid arpeggio figure
      c,8 g,8 e8 g,8 c,8 g,8 e8 g,8 |
      b,,8 g,8 e8 g,8 b,,8 g,8 e8 g,8 |
      a,,8 e,8 a,8 e,8 a,,8 e,8 c8 e,8 |
      g,,8 d,8 g,8 d,8 g,,8 d,8 b,8 d,8 |
    }
  >>
  \layout { }
}
