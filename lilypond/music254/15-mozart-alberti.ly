\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Mozart singing-allegro texture: lyrical melody (right hand) over Alberti bass (left hand)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "cantabile melody" }
      e''4 d''8 c''8 b'4 c''4 | a'2 g'4 r4 |
      g'4 a'8 b'8 c''4 d''4 | e''2. r4 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "Alberti bass" }
      c8 g8 e8 g8 c8 g8 e8 g8 |
      f8 c'8 a8 c'8 g8 d'8 b8 d'8 |
      c8 g8 e8 g8 f8 c'8 a8 c'8 |
      g8 d'8 b8 d'8 c4 r4 |
    }
  >>
  \layout { }
}
