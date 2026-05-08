\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chopin nocturne texture: ornate singing melody + wide broken-chord bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key bes \major \time 12/8 \omit Score.BarNumber
      \tempo "Andante"
      % Bar 1: ornate singing melody with turn
      f''4.\p ( ees''8 d''8 c''8 ) bes'4 \turn ( c''8 d''8 c''8 ) |
      % Bar 2: continuation with trill
      bes'4. \trill ( aes'8 g'8 f'8 ) ees'4 ( d'4. ) |
      % Bar 3: rising ornamental phrase
      f'8 ( g'8 aes'8 ) bes'8 ( c''8 d''8 ) ees''4 ( d''8 c''8 d''8 ) |
      % Bar 4: cadence
      f''4. ( ees''8 d''8 ees''8 ) f''4. r4. |
    }
    \new Staff {
      \clef bass \key bes \major \time 12/8 \omit Score.BarNumber
      % Wide broken-chord accompaniment spanning large register
      bes,,8 f,8 bes,8 d8 f8 bes8 d'8 f'8 bes'8 r4. |
      bes,,8 f,8 bes,8 d8 f8 aes8 c'8 ees'8 aes'8 r4. |
      ees,,8 bes,,8 ees,8 g,8 bes,8 ees8 g8 bes8 ees'8 r4. |
      bes,,8 f,8 bes,8 d8 f8 bes8 d'8 f'8 bes'8 r4. |
    }
  >>
  \layout { }
}
