\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % 4+4 hypermetric grouping — phrase 1 (bars 1-4) then phrase 2 (bars 5-8)
    \mark "Phrase 1 (bars 1–4)"
    c'4 e'4 g'4 e'4 |
    d'4 f'4 a'4 f'4 |
    e'4 g'4 c''4 g'4 |
    d'2 c'2 |
    \mark "Phrase 2 (bars 5–8)"
    e'4 g'4 c''4 g'4 |
    f'4 a'4 c''4 a'4 |
    g'4 b'4 d''4 b'4 |
    c''2. r4 |
  }
  \layout { }
}
