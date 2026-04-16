\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Lyric prosody: stressed syllables on beats 1 and 3
    \relative c'' {
      g4 f8 e d4 c | e4 d c2 |
    }
  }
  \addlyrics {
    COME to me and STAY a while.
  }
  \layout { }
}
