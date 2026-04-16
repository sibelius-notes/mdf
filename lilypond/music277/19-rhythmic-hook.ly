\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Syncopated rhythmic hook figure
    r8 c'8~ c'4 e'8 g'8~ g'4 |
    r8 c'8~ c'4 e'8 g'4 r8 |
    r8 c'8~ c'4 e'8 g'8~ g'4 |
    c''4 r4 r2 |
  }
  \layout { }
}
