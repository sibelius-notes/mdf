% I–IV–V–I in C: the foundational tonal cadential formula, common in folk and country.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  c1 f1 g1 c1
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e'4 g'4 c''4 g'4 |
  f'4 a'4 f'4 d'4 |
  g'4 b'4 d''4 b'4 |
  c''4 g'4 e'4 c'4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2 g,2 |
  f,2 c2 |
  g,2 d2 |
  c2 g,2 |
  \bar "|."
}

\score {
  <<
    \new ChordNames \harmScheme
    \new GrandStaff <<
      \new Staff \melody
      \new Staff \bassline
    >>
  >>
  \layout { }
}
