\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Handel aria ground bass: 4-bar ostinato bass cycling twice beneath melodic variation
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key d \minor
      \time 3/4
      \omit Score.BarNumber
      ^ \markup { \italic "aria (variation over ostinato)" }
      a'4 bes'4 a'4 | g'4 f'4 e'4 | f'4 g'4 a'4 | d'2. |
      a'8 bes'8 a'8 g'8 f'8 e'8 | d'4 e'4 f'4 | g'4 a'4 bes'4 | a'2. |
    }
    \new Staff {
      \clef bass
      \key d \minor
      \time 3/4
      _ \markup { \italic "ostinato bass (× 2)" }
      d4 e4 f4 | g4 a4 bes4 | a4 g4 f4 | d2. |
      d4 e4 f4 | g4 a4 bes4 | a4 g4 f4 | d2. |
    }
  >>
  \layout { }
}
