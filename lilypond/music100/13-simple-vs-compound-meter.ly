\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Simple meter (4/4) vs compound meter (6/8) — same melodic idea
\score {
  \new Staff {
    \clef treble \key c \major \omit Score.BarNumber
    \mark \markup { \small \bold "Simple (4/4)" }
    \time 4/4
    c'4_\markup { \tiny "1" } e'4_\markup { \tiny "2" }
    g'4_\markup { \tiny "3" } e'4_\markup { \tiny "4" } |
    f'4 e'4 d'4 c'2 |
    \mark \markup { \small \bold "Compound (6/8)" }
    \time 6/8
    c'8_\markup { \tiny "1" } e'8 g'8_\markup { \tiny "4" } e'8 g'8 a'8 |
    f'8 e'8 d'8 c'4. |
  }
  \layout { }
}
