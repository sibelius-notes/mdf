\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bach WTC C major Prelude: arpeggiated broken-chord pattern
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \tempo \markup \italic "WTC Book I, Prelude in C major — arpeggiation pattern"
      % Bar 1: C major arpeggio pattern
      r8 c'16 e'16 g'16 c''16 e''16 g''16
        g''8 e''16 c''16 g'16 e'16 c'8 |
      % Bar 2: same on next harmony (D minor)
      r8 d'16 f'16 a'16 d''16 f''16 a''16
        a''8 f''16 d''16 a'16 f'16 d'8 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c,1 |
      d,1 |
    }
  >>
  \layout { }
}
