\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Good prosody: stressed syllables land on strong beats (1, 3)
% "COME to ME and STAY a WHILE" — caps = natural word stress

chordsGood = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyGood = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 f8 e d4 c |
  e4 d c2 |
  a'4 g8 f e4 d |
  c4 d c2 \bar "|."
}

\score {
  <<
    \new ChordNames { \chordsGood }
    \new Staff {
      \melodyGood
      \addlyrics {
        COME to me and STAY a while.
        CLOSE your eyes and BREATHE the light.
      }
    }
  >>
  \layout { }
}
