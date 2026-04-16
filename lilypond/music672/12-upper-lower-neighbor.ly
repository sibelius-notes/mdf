\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Chapter 4.1 — Upper and lower neighbor notes shown in a single staff
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % Upper neighbor
    e''2^"structural" (f''4^"UN" e''4)^"return"
    % Lower neighbor
    e''2^"structural" (d''4^"LN" e''4)^"return"
  }
  \layout { }
}
