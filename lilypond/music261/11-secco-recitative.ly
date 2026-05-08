\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Recitative secco: speech-rhythm syllabic melody over sustained bass, two cadential phrases
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key g \minor
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "Recitativo secco" }
      d''4 d''8 d''8 c''4 bes'4 | a'4 g'4 r2 |
      f'4 f'8 g'8 a'4 bes'4 | a'2 g'2 |
    }
    \new Staff {
      \clef bass
      \key g \minor
      \time 4/4
      _ \markup { \italic "basso continuo (chordal punctuation)" }
      g,4 r4 r2 | d4 r4 r2 |
      bes,4 r4 r2 | d4 r4 d,2 |
    }
  >>
  \layout { }
}
