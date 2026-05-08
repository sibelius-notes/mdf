\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schumann character piece: melody with syncopated inner voice
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \minor \time 3/4 \omit Score.BarNumber
      \tempo "Innig"
      % Outer melody (stems up) + syncopated inner voice (stems down)
      <<
        { e''4 d''4 c''4 | b'2 a'4 | g'4 a'4 b'4 | c''2. }
        { r4 \stemDown a'4~ a'4~ | a'4~ a'4~ a'4 | ~ a'2. | ~ a'2. }
      >>
    }
    \new Staff {
      \clef bass \key a \minor \time 3/4 \omit Score.BarNumber
      <a, e>2. | <g, d>2. | <c g>2. | <a, e>2. |
    }
  >>
  \layout { }
}
