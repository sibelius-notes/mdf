\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "French overture: dotted section and fugal section"
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    % Slow dotted section (bars 1-2)
    c'4. e'16 e'16 f'4. g'16 g'16 |
    a'4. c''16 c''16 b'4. a'16 g'16 |
    % Fast fugal section (bars 3-4)
    \time 4/4
    c'16 d'16 e'16 f'16 g'16 a'16 b'16 c''16 d''16 e''16 f''16 g''16 a''16 b''16 c'''8 |
    g'16 a'16 b'16 c''16 d''16 e''16 f''16 g''16 e''16 f''16 g''4 r4 |
  }
  \layout { }
}
