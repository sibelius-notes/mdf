\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% ABAB end-rhyme: "down"/"around" rhyme (A), "town"/"found" rhyme (B)
% Phrase endings circled to show rhyme position

chordsABAB = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyABAB = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 f e d \mark \markup { \circle "A" } |
  b'4 a g f \mark \markup { \circle "B" } |
  a4 g f e \mark \markup { \circle "A" } |
  g4 f e2 \mark \markup { \circle "B" }
  \bar "|."
}

\score {
  <<
    \new ChordNames { \chordsABAB }
    \new Staff {
      \melodyABAB
      \addlyrics {
        walk -- ing down the road a -- lone,
        leav -- ing town be -- hind my back,
        turn -- ing a -- round to find my home,
        and all I'd lost I found
      }
    }
  >>
  \layout { }
}
