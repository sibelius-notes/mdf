\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Singspiel folk-style tune: simple diatonic 4-bar melody with plain bass (Mozart/Beethoven style)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key g \major
      \time 2/4
      \omit Score.BarNumber
      ^ \markup { \italic "Singspiel Lied" }
      g'4 a'4 | b'4 c''4 | d''4 b'4 | g'2 |
      a'4 b'4 | c''4 a'4 | b'4 g'4 | g'2 |
    }
    \new Staff {
      \clef bass
      \key g \major
      \time 2/4
      _ \markup { \italic "simple bass" }
      g,4 d4 | g,4 d4 | g,4 d4 | g,2 |
      d4 d4 | g,4 d4 | g,4 d4 | g,2 |
    }
  >>
  \layout { }
}
