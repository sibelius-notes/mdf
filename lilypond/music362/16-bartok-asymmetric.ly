\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bartók asymmetric meter: 7/8 Bulgarian-style (2+2+3 grouping), 4 bars
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 7/8 \omit Score.BarNumber
      \tempo "Vivace"
      % 2+2+3 groupings marked by beam breaks
      d''8 e''8 f''8 e''8 d''8 c''8 b'8 |
      a'8 b'8 c''8 b'8 a'8 g'8 fis'8 |
      g'8 a'8 bes'8 a'8 g'8 f'8 e'8 |
      d'4 f'4 a'8 g'8 fis'8 |
    }
    \new Staff {
      \clef bass \key c \major \time 7/8 \omit Score.BarNumber
      % Drone-like bass, asymmetric accents
      d4._\markup { \tiny "2+2+3" } a4. d8 |
      d4. a4. d8 |
      g4. d4. g8 |
      d4 d4 d8 d8 d8 |
    }
  >>
  \layout { }
}
