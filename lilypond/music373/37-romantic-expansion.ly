\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Classical: tight EEC
      c''4^"Classical EEC" b'4 c''2^"PAC" |
      %% Romantic expansion: suffix + extended cadences
      c''4^"Romantic" b'4 c''4 b'4 |
      c''4 b'4 c''4 b'4 |
      c''4^"expansion" ees''4 d''4 c''2^"PAC (extended)" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      g,2 c,2 |
      g,2 c,2 |
      g,2 c,2 |
      c,4 aes,4 g,4 c,2 \bar "|."
    }
  >>
  \layout { }
}
