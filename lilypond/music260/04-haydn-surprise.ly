\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Haydn Surprise Symphony No.94: theme with surprise forte chord
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 2/4 \omit Score.BarNumber
      % Bars 1-4: simple pp theme
      g'8\pp a'8 b'8 c''8 |
      b'8 a'8 g'4 |
      d''8 e''8 d''8 c''8 |
      b'8 a'8 g'4 |
      % Bar 5: sudden ff surprise chord
      g'4\ff g'4 |
      % Bars 6-8: pp return
      g'8\pp a'8 b'8 c''8 |
      b'8 a'8 g'4 |
      d''4 g'4 \bar "|."
    }
    \new Staff {
      \clef bass \key g \major \time 2/4 \omit Score.BarNumber
      g4\pp b,4 |
      g4 g,4 |
      b,4 a,4 |
      g,4 g,4 |
      % Bar 5: surprise forte bass
      <g, b, d g>4\ff r4 |
      g,4\pp b,4 |
      g,4 g,4 |
      g,4 g,4 \bar "|."
    }
  >>
  \layout { }
}
