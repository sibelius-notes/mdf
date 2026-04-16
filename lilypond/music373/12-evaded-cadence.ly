\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Cadential approach
      c''4^"I6/4" g'4 b'4^"V7" c''4^"evaded: I6" |
      %% Re-approach and true PAC
      c''4^"I6/4" g'4 b'4^"V7" c''2^"PAC" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      g,4 g,4 g,4 e,4 |
      g,4 g,4 g,4 c,2 \bar "|."
    }
  >>
  \layout { }
}
