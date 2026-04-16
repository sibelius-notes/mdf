\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Question phrase (ends HC on V) + answer phrase (ends PAC on I)
    \relative c'' {
      \mark \markup { \italic "Question (HC)" }
      e4 d c b | a2 d2 |
      \mark \markup { \italic "Answer (PAC)" }
      e4 f g e | d4 c c2 |
    }
  }
  \layout { }
}
