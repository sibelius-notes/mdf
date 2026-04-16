\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Medieval modes: Dorian (D), Phrygian (E), Lydian (F), Mixolydian (G)
\score {
  \new Staff {
    \clef treble \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    d'4^\markup { \small "Dorian" } e'4 f'4 g'4 a'4 b'4 c''4 d''4 \bar "||"
    e'4^\markup { \small "Phrygian" } f'4 g'4 a'4 b'4 c''4 d''4 e''4 \bar "||"
    f'4^\markup { \small "Lydian" } g'4 a'4 b'4 c''4 d''4 e''4 f''4 \bar "||"
    g'4^\markup { \small "Mixolydian" } a'4 b'4 c''4 d''4 e''4 f''4 g''4 \bar "|."
  }
  \layout { }
}
