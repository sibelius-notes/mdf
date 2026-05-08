\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Fugue episode (sequence) and stretto"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key a \minor
      \time 4/4
      ^ \markup { \italic "treble" }
      % Bars 1-2: sequential descending passage
      g'8 f'8 e'8 d'8 c'8 b8 a8 g8 |
      f'8 e'8 d'8 c'8 b8 a8 g8 f8 |
      % Bars 3-4: stretto entry (subject fragment)
      a8 b8 c'8 d'8 e'8 f'8 e'8 d'8 |
      c'8 b8 a4 r2 |
    }
    \new Staff {
      \clef bass
      \key a \minor
      \time 4/4
      _ \markup { \italic "bass" }
      % Bars 1-2: sequential passage a fifth lower
      r1 |
      g,8 a,8 b,8 c8 d8 e8 f8 g8 |
      % Bars 3-4: stretto overlap
      a,8 b,8 c8 d8 e8 f8 e8 d8 |
      c8 b,8 a,4 r2 |
    }
  >>
  \layout { }
}
