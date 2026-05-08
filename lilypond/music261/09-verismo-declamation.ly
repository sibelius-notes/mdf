\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Verismo vocal style: speech-like parlando + sudden passionate outburst
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 4/4 \omit Score.BarNumber
      \tempo \markup \italic "Verismo: speechlike declamation + sudden passion"
      % Bars 1-2: parlando (speech-like, syllabic)
      a'4\pp b'4 c''4 b'4 |
      a'8 b'8 a'4 g'2 |
      % Bars 3-4: sudden lyric outburst
      e''2\ff \> ( d''4 c''4 ) |
      b'4\pp ( a'4 ) g'2 \bar "|."
    }
    \new Staff {
      \clef bass \key a \minor \time 4/4 \omit Score.BarNumber
      a,2\pp e2 |
      a,2 e,2 |
      a,2\ff f2 |
      e2 a,2 \bar "|."
    }
  >>
  \layout { }
}
