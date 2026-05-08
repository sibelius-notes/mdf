\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schubert lyric piano texture: cantabile melody over waltz-style bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      \tempo "Andante"
      % Flowing cantabile melody
      e'4.\p ( f'8 g'4 ) |
      a'4 ( g'4 f'4 ) |
      e'4 ( d'4 c'4 ) |
      d'2 r4 |
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      % Waltz-style bass: root + chord on beats 2-3
      c,4\p <e g>4 <e g>4 |
      f,4 <a c'>4 <a c'>4 |
      g,4 <b d'>4 <b d'>4 |
      g,4 <b d>4 <b d>4 |
    }
  >>
  \layout { }
}
