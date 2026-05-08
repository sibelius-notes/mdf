% I–vi–IV–V doo-wop: Heart and Soul, Stand By Me, Blue Moon. The quintessential 1950s loop.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  c1 a1:m f1 g1
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e'4 f'4 g'4 e'4 |
  e'4 c'4 e'4 f'4 |
  f'4 a'4 c''4 a'4 |
  b'4 g'4 d'4 g'4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2 g,2 |
  a,2 e2 |
  f,2 c2 |
  g,2 d2 |
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
