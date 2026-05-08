\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Baroque ornament types written out: trill, mordent, turn
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Trill written out (tr on E: oscillation E-D)
    e'16^\markup { \tiny "tr (trill)" }
      d'16 e'16 d'16 e'16 d'16 e'8 |
    % Mordent written out (on G: G-F#-G)
    g'16^\markup { \tiny "prall (mordent)" }
      fis'16 g'4. |
    % Turn written out on A: B-A-G-A
    b'16^\markup { \tiny "turn" }
      a'16 g'16 a'8. |
    e'2 |
  }
  \layout { }
}
