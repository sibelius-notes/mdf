\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Pentatonic hook (C D E G A only — no F or B)
    \relative c'' {
      g4 e g a | g4 e d2 |
    }
  }
  \layout { }
}
