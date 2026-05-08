\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Baroque forms quick-reference: four characteristic gestures
\score {
  \new Staff {
    \clef treble \key c \major \omit Score.BarNumber
    \time 4/4
    c'2^\markup { \box \small "Cantata" } r4 g'4 |
    \time 4/4
    g'8^\markup { \box \small "Fugue" } a'8 b'8 c''8 d''8 c''8 b'8 a'8 |
    \time 3/4
    e'4.^\markup { \box \small "Dance" } f'8 g'4~ |
    g'4 f'4 e'4 |
    \time 4/4
    c''2\ff^\markup { \box \small "Concerto" } c'8\pp c'8 c'8 c'8 |
  }
  \layout { }
}
