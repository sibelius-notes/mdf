\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven Op.109 late style: lyrical improvisatory theme with trill
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key e \major \time 3/4 \omit Score.BarNumber
      \tempo "Vivace, ma non troppo"
      % Bar 1: lyrical figuration
      e''8\p ( gis''8 b''8 e'''8 ) b''4 |
      % Bar 2: ornamental descent with trill
      gis''4 \trill fis''8 ( e''8 ) dis''4 |
      % Bar 3: continued lyricism
      e''4 ( b'4 gis'4 ) |
      % Bar 4: cadential trill
      gis'4 \trill fis'8 ( e'8 ) e'4 \bar "|."
    }
    \new Staff {
      \clef bass \key e \major \time 3/4 \omit Score.BarNumber
      % Sustained harmonies
      <e, b, gis>2.\p |
      <e, b, dis>2. |
      <e, b, e>2. |
      <e, b, e>2. \bar "|."
    }
  >>
  \layout { }
}
