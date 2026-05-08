\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 3/4
    \omit Score.BarNumber
    % Bar 1: flute — pure tone, soft, no accent
    a'2.\p^\markup { \tiny "flute: pure sine" } |
    % Bar 2: oboe — forte with accent, rich harmonics
    a'2.\f-\markup { \tiny "oboe: rich harmonics" } |
    % Bar 3: clarinet — staccato quarter notes, odd harmonics
    a'4-.\mf^\markup { \tiny "clarinet: odd harmonics" } a'4-. a'4-. |
  }
  \layout { }
}
