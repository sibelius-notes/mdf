\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Glarean: Ionian (C) and Aeolian (A) — the two new modes in Dodecachordon (1547)
\score {
  \new Staff {
    \clef treble \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    c'4^\markup { \small "Ionian (mode 11)" }
    d'4 e'4 f'4 g'4 a'4 b'4 c''4 \bar "||"
    a4^\markup { \small "Aeolian (mode 9)" }
    b4 c'4 d'4 e'4 f'4 g'4 a'4 \bar "|."
  }
  \layout { }
}
