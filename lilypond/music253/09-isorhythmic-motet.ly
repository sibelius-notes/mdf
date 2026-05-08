\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Isorhythmic motet: talea rhythm in tenor (color = 4 notes), duplum melody above
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key f \major
      \time 6/4
      \omit Score.BarNumber
      ^ \markup { \italic "duplum" }
      c''4 d''4 e''4 f''4 e''4 d''4 |
      c''2. d''4 c''4 bes'4 |
      a'4 bes'4 c''4 d''2 c''4 |
      bes'2. a'2 g'4 |
    }
    \new Staff {
      \clef bass
      \key f \major
      \time 6/4
      _ \markup { \italic "tenor (talea)" }
      f2 f4 g2 g4 |
      f2 f4 g2 g4 |
      f2 f4 g2 g4 |
      f2 f4 g2 g4 |
    }
  >>
  \layout { }
}
