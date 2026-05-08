% I–V–vi–IV in C: the ubiquitous pop loop (Don't Stop Believin', Let It Be).
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  c1 g1 a1:m f1
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g'4 e'4 c'4 e'4 |
  d'4 b4 g4 b4 |
  c'4 e'4 a'4 g'4 |
  a'4 g'4 f'4 e'4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2 g,2 |
  g,2 d2 |
  a,2 e2 |
  f,2 c2 |
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
