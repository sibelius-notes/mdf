% R&B/neo-soul extended chord loop: Cmaj9–Am11–Fmaj7–G9sus4. Smooth stepwise melody over lush 7th/9th harmony. "If I Ain't Got You", D'Angelo-style vamp.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  c1:maj9 a1:m11 f1:maj7 g1:9sus4
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e'4 d'4 b4 d'4 |
  c'4 e'4 g'4 a'4 |
  a'4 g'4 f'4 e'4 |
  f'4 d'4 g4 c'4 |
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
