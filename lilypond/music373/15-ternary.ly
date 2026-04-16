\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    %% A section: closed in C major
    c''2^"A (C major)" e''2 | g''2 c''2^"PAC: I" |
    %% B section: contrasting key (A minor)
    e''2^"B (a minor)" a'2 | b'2 a'2^"PAC: i" |
    %% A' section: return in C major
    c''2^"A' (C major)" e''2 | g''2 c''2^"PAC: I" \bar "|."
  }
  \layout { }
}
