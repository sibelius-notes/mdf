\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Three-key exposition (Type 2 Sonata): P-zone I, S1-zone iii, S2-zone V
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1–2: P-zone in C major (I) — opening gesture
      c''4^\markup { "P" } e''4 g''4 e''4 |
      d''4 c''4 b'4 c''4 |
      % Bar 3: Medial caesura — half cadence on G
      g'4^\markup { "MC" } r4 r2 |
      % Bar 4: S1-zone in E minor (iii)
      e''4^\markup { "S¹" } g''4 b''4 g''4 |
      % Bar 5: EEC — authentic cadence in E minor, then S2 in G
      b'4^\markup { "EEC" } e''4 g''4^\markup { "S²" } a''4 |
      % Bar 6: S2 in G major — closing on G (V:PAC)
      b''4 a''4 g''2^\markup { "V:PAC" } |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Sustained roots
      c1 |
      c1 |
      g,1 |
      e1 |
      e2 g2 |
      g1 |
    }
  >>
  \layout { }
}
