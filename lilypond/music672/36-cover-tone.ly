\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.5 — Cover tone (Deckton): prominent note above the Urlinie
% Urlinie at e''/d''/c'', but surface melody carries g''/f''/e'' above it
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    << {
      % Cover tone melody (upper)
      g''2^"cover" f''2^"cover"
      e''1^"cover"
    } \\ {
      % Structural Urlinie (lower inner voice)
      e''2^"3̂" d''2^"2̂"
      c''1^"1̂"
    } >>
  }
  \layout { }
}
