\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \time 4/4
    \omit Score.BarNumber
    % Chorus in C, then sudden key change up a whole step to D
    \key c \major
    \mark "Chorus — C major"
    <e' g' c''>1 | <f' a' c''>1 | <g' b' d''>1 |
    \bar "||"
    \key d \major
    \mark "Key up to D major"
    <fis' a' d''>1 | <g' b' d''>1 | <a' cis'' e''>1 | <d'' fis'' a''>1 |
  }
  \layout { }
}
