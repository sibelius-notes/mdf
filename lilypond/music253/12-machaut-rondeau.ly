\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Machaut rondeau opening — 2-voice texture, Cantus above Tenor, Dorian mode
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key d \dorian
      \time 3/4
      \omit Score.BarNumber
      ^ \markup { \italic "cantus" }
      d''4 c''4 bes'4 | a'2 g'4 | a'4 bes'4 a'4 | g'2 f'4 |
      e'4 f'4 g'4 | a'2. | d''4 c''4 bes'4 | a'2. |
    }
    \new Staff {
      \clef bass
      \key d \dorian
      \time 3/4
      _ \markup { \italic "tenor" }
      d'4 f4 g4 | d'2 g4 | f4 d4 e4 | d2 c4 |
      c4 d4 e4 | d2. | d'4 f4 g4 | d'2. |
    }
  >>
  \layout { }
}
