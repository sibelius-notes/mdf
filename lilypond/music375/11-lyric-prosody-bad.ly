\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Bad prosody: unstressed syllable lands on strong beat
% "to-NIGHT" has stress on -NIGHT but here "to" falls on beat 1

chordsBad = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyBad = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  c8 d4 e8~ e4 f |
  g4 e d2 |
  a'8 b4 c8~ c4 d |
  e4 c b2 \bar "|."
}

\score {
  <<
    \new ChordNames { \chordsBad }
    \new Staff {
      \melodyBad
      \addlyrics {
        to- NIGHT the sun will shine a- gain.
        be- CAUSE the words don't fit the strain.
      }
    }
  >>
  \layout { }
}
