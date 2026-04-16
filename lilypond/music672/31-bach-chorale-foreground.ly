\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Chapter 7 — Bach chorale phrase foreground: full surface of a short phrase
% Short phrase in C major, SATB texture simplified to soprano + bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Soprano foreground with passing tones
      e''4^"3̂" f''4_"PT" g''4 f''4_"PT"
      e''4^"3̂" d''4^"2̂" e''8 d''8 c''4^"1̂"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,4_"I" a,,4_"vi" f,,4_"IV" d,4_"ii"
      c,4_"I" g,,4_"V" g,,4_"V" c,4_"I"
    }
  >>
  \layout { }
}
