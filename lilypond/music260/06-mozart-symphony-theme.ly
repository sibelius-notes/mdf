\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mozart symphony opening style: forte fanfare then piano lyrical continuation
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Bar 1: forte fanfare C-E-G
    <c' e' g'>4\f r4 <e' g' c''>4 r4 |
    % Bars 2-4: lyrical stepwise melody pp
    e''4\p d''4 c''4 b'4 |
    a'4 g'4 f'4 e'4 |
    d'4 e'4 c'2 \bar "|."
  }
  \layout { }
}
