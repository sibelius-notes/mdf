\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key c \major \time 3/4
    \omit Score.BarNumber
    %% Minuet (rounded binary outline)
    c''2.^"Minuet A" | g'2.^"→V" | c''2.^"A'" | c''2.^"PAC" |
    %% Trio (contrasting rounded binary)
    f''2.^"Trio B" | c''2.^"→I" | f''2.^"B'" | f''2.^"PAC" |
    %% Minuet da capo
    c''2.^"Menuet da capo" | g'2. | c''2. | c''2.^"PAC" \bar "|."
  }
  \layout { }
}
