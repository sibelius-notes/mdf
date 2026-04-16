\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Pickup/anacrusis leading into the chorus
    \relative c'' {
      \mark \markup { \bold "Verse end" }
      e4 d c b |
      \mark \markup { \bold "Pickup" }
      r2 r4 g8 a |
      \mark \markup { \bold "Chorus" }
      b2 c4 d | e1 |
    }
  }
  \layout { }
}
