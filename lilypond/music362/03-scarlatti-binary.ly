\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Scarlatti sonata: binary form with hand-crossing texture
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \major \time 3/8 \omit Score.BarNumber
      % Bars 1-2: hand-crossing jumps
      \mark \markup { \bold "Hand crossing" }
      d''8\mf a'8 fis''8 |
      e''8 b'8 g''8 |
      % Bars 3-4: contrasting lyrical section
      fis''4\mp e''8 |
      d''4 r8 \bar "|."
    }
    \new Staff {
      \clef bass \key d \major \time 3/8 \omit Score.BarNumber
      % Steady bass
      d4.\mf |
      a,4. |
      d4\mp fis8 |
      d4 r8 \bar "|."
    }
  >>
  \layout { }
}
