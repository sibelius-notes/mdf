% vi–IV–I–V: same chords rotated (Axis of Awesome rotation). Minor tonic feel.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  a1:m f1 c1 g1
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e'4 a'4 g'4 e'4 |
  f'4 a'4 c''4 a'4 |
  g'4 e'4 c'4 e'4 |
  d'4 b4 g4 b4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  a,2 e2 |
  f,2 c2 |
  c2 g,2 |
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
