\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Renaissance imitative counterpoint, Josquin style — 2 voices, subject enters 5th below
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 2/2
      \omit Score.BarNumber
      ^ \markup { \italic "superius (subject)" }
      c'2 d'4 e'4 | f'2 e'2 | d'2 c'2 | d'1 |
      e'2 f'4 g'4 | a'2 g'2 | f'2 e'2 | d'1 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 2/2
      _ \markup { \italic "tenor (answer at 5th below)" }
      r1 | r1 |
      f2 g4 a4 | bes2 a2 | g2 f2 | g1 |
      a2 bes4 c'4 | d'2 c'2 |
    }
  >>
  \layout { }
}
