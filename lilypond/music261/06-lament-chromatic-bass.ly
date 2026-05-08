\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Lament aria / Purcell style: chromatic ground bass (passus duriusculus)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \minor \time 3/4 \omit Score.BarNumber
      % Vocal lament over 4 bars ground bass: falling melody with suspensions
      d''2.\p |
      cis''2 d''4 |
      c''2 bes'4 |
      bes'4 ( a'2 ) |
      % Second cycle: deeper anguish
      g'2.~ |
      g'4 fis'2 |
      f'2 ees'4 |
      d'2 r4 |
    }
    \new Staff {
      \clef bass \key g \minor \time 3/4 \omit Score.BarNumber
      % Descending chromatic tetrachord ground bass
      g,2. |
      fis,2. |
      f,2. |
      e,2. |
      ees,2. |
      d,2. |
      % Repeat
      g,2. |
      d,2. |
    }
  >>
  \layout { }
}
