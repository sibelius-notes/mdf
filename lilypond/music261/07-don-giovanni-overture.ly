\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mozart Don Giovanni overture opening motif: D minor thunderclap + scalic descent
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4 \omit Score.BarNumber
      % Bar 1: D minor ff whole chord (thunderclap)
      <d' f' a' d''>1\ff |
      % Bars 2-3: scalic descent D-C-Bb-A-G-F#-G 8th notes
      d''8 c''8 bes'8 a'8 g'8 fis'8 g'4 |
      d''8 c''8 bes'8 a'8 g'8 fis'8 g'4 |
      % Bar 4: dominant pedal A
      a'1 \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4 \omit Score.BarNumber
      % Bar 1: D minor thunderclap bass
      <d, d>1\ff |
      % Bars 2-3: bass descent
      d8 c8 bes,8 a,8 g,8 fis,8 g,4 |
      d8 c8 bes,8 a,8 g,8 fis,8 g,4 |
      % Bar 4: dominant
      a,1 \bar "|."
    }
  >>
  \layout { }
}
