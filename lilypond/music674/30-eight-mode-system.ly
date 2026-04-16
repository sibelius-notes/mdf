\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Medieval eight-mode system: Modes 1-4 (D, E, F, G finals) shown as scale fragments
\score {
  \new Staff {
    \clef treble \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    d'4^\markup { \small "Mode 1 (D auth.)" } e'4 f'4 g'4 a'4 \bar "||"
    e'4^\markup { \small "Mode 3 (E auth.)" } f'4 g'4 a'4 b'4 \bar "||"
    f'4^\markup { \small "Mode 5 (F auth.)" } g'4 a'4 bes'4 c''4 \bar "||"
    g'4^\markup { \small "Mode 7 (G auth.)" } a'4 b'4 c''4 d''4 \bar "|."
  }
  \layout { }
}
