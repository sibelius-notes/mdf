\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Bar 1: swell shape — crescendo from pp to ff
    a'1\pp\< |
    % Bar 2: decrescendo back to pp — full SHM envelope
    a'1\ff\> |
  }
  \header {
    piece = \markup {
      \column {
        \bold "Tuning Fork: SHM Amplitude Envelope"
        \small "f = 440 Hz,  x(t) = A·cos(2πft)"
      }
    }
  }
  \layout { }
}
