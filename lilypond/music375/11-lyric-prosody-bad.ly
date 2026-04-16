\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Prosody mismatch: unstressed syllable lands on beat 1
    \relative c'' {
      c8 d4 e8~ e4 f | g4 e d2 |
    }
  }
  \addlyrics {
    to- NIGHT the sun will shine a- gain.
  }
  \layout { }
}
