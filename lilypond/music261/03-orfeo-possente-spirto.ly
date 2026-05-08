\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Monteverdi Possente spirto: ornate Baroque vocal style
\score {
  \new Staff {
    \clef treble \key f \major \time 4/4 \omit Score.BarNumber
    \tempo \markup \italic "Possente spirto: ornate vocal style"
    % Bar 1: elaborate run with turns and mordents
    f'4\mf g'8 ( a'8 ) bes'8 ( a'8 g'8 f'8 ) |
    % Bar 2: trill and long ornamented descent
    a'4 \trill g'8 ( a'8 ) f'4 \turn e'4 |
    % Bar 3: ascending run over octave
    c'8 d'8 e'8 f'8 g'8 a'8 bes'8 c''8 |
    % Bar 4: flourish and cadence
    d''8 ( c''8 bes'8 a'8 ) g'4 f'4 \bar "|."
  }
  \layout { }
}
