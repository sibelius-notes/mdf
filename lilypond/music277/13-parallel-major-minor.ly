\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % C major then C minor borrowing (bVI from parallel minor)
      \mark "C major"
      <e' g' c''>1
      \mark "+ bVI"
      <aes' c'' ees''>1
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c1 aes,1
    }
  >>
  \layout { }
}
