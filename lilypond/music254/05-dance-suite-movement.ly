\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Sarabande: accent on beat 2"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key a \minor
      \time 3/4
      ^ \markup { \italic "sarabande" }
      a'4 b'4. c''8 |
      b'4 c''4. d''8 |
      e''4 d''4. c''8 |
      a'2. |
    }
    \new Staff {
      \clef bass
      \key a \minor
      \time 3/4
      a4 e4 a,4 |
      g4 g,2 |
      c'4 g2 |
      a,2. |
    }
  >>
  \layout { }
}
