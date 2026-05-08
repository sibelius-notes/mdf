\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Puccini verismo: lyrical 4-bar phrase with expressive chromatic bass (chromatically descending)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key aes \major
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "lyrical verismo phrase" }
      ees''2 f''4 g''4 | aes''2~ aes''4 g''4 | f''4 ees''4 des''4 c''4 | bes'1 |
    }
    \new Staff {
      \clef bass
      \key aes \major
      \time 4/4
      _ \markup { \italic "chromatic bass descent" }
      aes,4 g,4 ges,4 f,4 | ees,4 e,4 f,4 ges,4 | aes,4 g,4 f,4 e,4 | ees,1 |
    }
  >>
  \layout { }
}
