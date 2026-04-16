\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key d \minor \time 4/4
    \omit Score.BarNumber
    %% Cyclic motive: appears in all movements (Franck-style)
    d'4^"Mvt. I" f'4 a'4 c''4 |
    %% Same motive transformed (Mvt. II slow character)
    d''4.^"Mvt. II" f''8 a''2 |
    %% Same motive in finale
    d'8^"Mvt. III" f'8 a'8 c''8 d''4. r8 \bar "|."
  }
  \layout { }
}
