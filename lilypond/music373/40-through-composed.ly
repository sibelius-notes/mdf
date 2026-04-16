\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key g \minor \time 6/8
    \omit Score.BarNumber
    %% Through-composed: each section distinct (Der Erlkoenig style)
    g'4.^"Narrator (g)" a'4 bes'8 |
    bes'4.^"Father (Bb)" c''4 d''8 |
    d''4.^"Child (cry)" ees''8 d''4 |
    fis'4.^"Erlkoenig (seductive)" g'4 a'8 |
    g'4^"Narrator" fis'4 g'4.^"end" \bar "|."
  }
  \layout { }
}
