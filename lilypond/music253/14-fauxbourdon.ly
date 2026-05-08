\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Fauxbourdon: chant in cantus, two lower voices in parallel 6ths and 3rds (6-3 chords)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key f \major
      \time 4/4
      \omit Score.BarNumber
      <<
        { ^ \markup { \italic "cantus (chant)" }
          f'2 g'2 | a'2 bes'2 | a'2 g'2 | f'1 | }
        \\
        { _ \markup { \italic "contratenor" }
          d'2 e'2 | f'2 g'2 | f'2 e'2 | d'1 | }
      >>
    }
    \new Staff {
      \clef bass
      \key f \major
      \time 4/4
      _ \markup { \italic "tenor (sixth below cantus)" }
      a2 c'2 | c'2 d'2 | c'2 bes2 | a1 |
    }
  >>
  \layout { }
}
