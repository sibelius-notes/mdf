\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Internal rhyme: "bright"/"night" rhyme within the line (mid-bar and bar-end)
% Also "gleam"/"dream" at internal/end positions in line 2

chordsInt = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyInt = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g8 g f4 e8 e d4 |
  c4 d e2 |
  a'8 a g4 f8 f e4 |
  d4 e c2 \bar "|."
}

\score {
  <<
    \new ChordNames { \chordsInt }
    \new Staff {
      \melodyInt
      \addlyrics {
        bright light fills the night with gleam.
        so dream of streams that catch the beam.
      }
    }
  >>
  \layout { }
}
