\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Internal rhyme: two rhyming syllables within a single line
    \relative c'' {
      g8 g f4 e8 e d4 | c4 d e2 |
    }
  }
  \addlyrics {
    bright light fills the night with gleam.
  }
  \layout { }
}
