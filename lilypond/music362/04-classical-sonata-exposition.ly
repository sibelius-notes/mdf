\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Classical sonata exposition schema: P-theme, TR, S-theme, closing, double bar
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bars 1-2: P-theme, C major tonic
      c''4^\markup { \bold "P (I)" }\f e''4 g''4 c''4 |
      e''4 d''4 c''2 |
      % Bar 3: Transition, modulating
      g''4^\markup { \bold "TR" } a''4 b''4 g''4 |
      % Bars 4-5: S-theme in G major
      d''4^\markup { \bold "S (V)" }\p e''4 d''4 c''4 |
      b'4 a'4 g'2 |
      % Bars 6-7: Closing theme, PAC in G
      g''4^\markup { \bold "C" } fis''4 g''4 d''4 |
      b'4 g'4 d'4 g'4 |
      % Bar 8: double bar
      g'1 \bar "||"
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c2\f g,2 |
      a,2 c2 |
      g,2 d2 |
      g,2\p d2 |
      g,2 g,2 |
      g,4 d4 g,4 g4 |
      d4 b,4 g,4 g,4 |
      g,1 \bar "||"
    }
  >>
  \layout { }
}
