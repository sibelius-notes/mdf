\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Cool jazz melodic style: wide-interval melody over ii-V-I in F major
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key f \major \time 4/4 \omit Score.BarNumber
      \tempo \markup { \italic "Cool, relaxed" }
      % ii: Gm7
      g'4._\markup { \tiny "Gm7" } bes'8~ bes'4 d''4 |
      % V: C7
      c''4._\markup { \tiny "C7" } e''8~ e''4 g'4 |
      % I: Fmaj7
      a'4._\markup { \tiny "Fmaj7" } c''8~ c''4 f''4 |
      f''2 r2 |
    }
    \new Staff {
      \clef bass \key f \major \time 4/4 \omit Score.BarNumber
      % Walking bass
      g,4 bes,4 d4 f4 |
      c,4 e,4 bes,4 g,4 |
      f,4 a,4 c4 e4 |
      f,2 r2 |
    }
  >>
  \layout { }
}
