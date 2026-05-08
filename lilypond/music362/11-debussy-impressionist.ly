\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Debussy impressionist piano: pentatonic melody + whole-tone bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      \tempo \markup \italic "Impressionism: color > function"
      % Pentatonic melody (C D E G A) floating in high register
      g''4\pp ( a''4 e''4 d''4 ) |
      c''4 ( e''4 g''4 a''4 ) |
      e''4 ( d''4 c''2 ) |
      g''4 ( a''4 ) e''2 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Whole-tone bass motion with sustain pedal implied
      c,2\pp d,2 |
      e,2 fis,2 |
      gis,2 ais,2 |
      c2 r2 \bar "|."
    }
  >>
  \layout { }
}
