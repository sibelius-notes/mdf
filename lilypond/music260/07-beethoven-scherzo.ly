\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven scherzo: displaced accents, off-beat sforzandi, sparse bass
\score {
  <<
    \new Staff \with { instrumentName = \markup \small "Scherzo:" } {
      \clef treble \key c \major \time 3/4 \omit Score.BarNumber
      \tempo \markup \italic "Scherzo: displaced accents, comic surprise"
      % Bar 1: accent on beat 2
      c'4 e'\sfz g'4 |
      % Bar 2: accent on beat 2 again
      g'4 e'\sfz c'4 |
      % Bar 3: syncopated
      a'4 f'\sfz d'4 |
      % Bar 4: resolution
      g'2.\p \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 3/4 \omit Score.BarNumber
      % Sparse bass
      c2. |
      c4 r4 r4 |
      f2. |
      g2 r4 \bar "|."
    }
  >>
  \layout { }
}
