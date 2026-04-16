\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Schoenberg twelve-tone row: a sample P0 row using all 12 pitch classes
\score {
  \new Staff {
    \clef treble \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    e'4^\markup { \small "P0 row" }
    f'4 g'4 bes'4 b'4
    cis''4 d''4 fis''4 aes''4
    a''4 c'''4 ees'''4
    \bar "|."
  }
  \layout { }
}
