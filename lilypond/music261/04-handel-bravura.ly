\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Handel Giulio Cesare style: Baroque bravura coloratura aria
\score {
  \new Staff {
    \clef treble \key d \major \time 4/4 \omit Score.BarNumber
    \tempo \markup \italic "Baroque bravura: coloratura virtuosity"
    % Bar 1: rapid ascending 16th-note run
    d'16\f e'16 fis'16 g'16 a'16 b'16 cis''16 d''16
      e''16 fis''16 g''16 a''16 b''8 \trill a''8 |
    % Bar 2: descending run
    g''16 fis''16 e''16 d''16 cis''16 b'16 a'16 g'16
      fis'16 e'16 d'16 cis'16 d'4 |
    % Bar 3: mixed run with trill
    a'16 b'16 cis''16 d''16 e''8 \trill d''8 cis''16 d''16 e''16 fis''16 g''4 |
    % Bar 4: brilliant conclusion
    fis''16 e''16 d''16 cis''16 b'16 a'16 g'16 fis'16
      e'8 fis'8 d'4 \bar "|."
  }
  \layout { }
}
