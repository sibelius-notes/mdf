\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bel canto coloratura chain: fast ascending scale + trill over sustained chord
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key a \major
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "coloratura cadenza" }
      a'8 b'8 cis''8 d''8 e''8 fis''8 gis''8 a''8 |
      a''4\trill gis''4 fis''4 e''4 |
      e''8 d''8 cis''8 b'8 a'8 gis'8 fis'8 e'8 |
      e'4\trill d'8 cis'8 d'2 |
    }
    \new Staff {
      \clef bass
      \key a \major
      \time 4/4
      _ \markup { \italic "sustained harmonic support" }
      <a, cis e a>1 | <e, b, e gis>1 | <a, cis e a>1 | <e, b, e>2 <a, cis e a>2 |
    }
  >>
  \layout { }
}
