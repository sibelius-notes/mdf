\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new StaffGroup <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Call phrase (lead voice)
      \relative c'' {
        \mark \markup { \bold "Call" }
        g4 a b c | r1 |
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Response phrase (answering voice)
      \relative c'' {
        r1 |
        \mark \markup { \bold "Response" }
        e4 d c b |
      }
    }
  >>
  \layout { }
}
