\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 12/8
    \omit Score.BarNumber
    %% Minimalist phase: two voices drifting
    << {
      \repeat unfold 3 { e''8^"Piano 1" fis'' b' cis'' d'' a' }
    } \\ {
      r8 e''8^"Piano 2 (+1)" fis'' b' cis'' d'' a' e'' fis'' b' cis'' d''
    } >>
    \bar "|."
  }
  \layout { }
}
