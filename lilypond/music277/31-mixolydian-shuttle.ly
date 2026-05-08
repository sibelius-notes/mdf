% Mixolydian I–bVII–IV–I in G: F-natural (♭7) borrowed from G Mixolydian. "Sweet Home Alabama", "Hey Jude". The bVII chord is the Mixolydian fingerprint.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  g1 f1 c1 g1
}

melody = {
  \clef treble \key g \major \time 4/4
  \omit Score.BarNumber
  d'4 g'4 b'4 d''4 |
  c''4 f'4 a'4 c''4 |
  g'4 e'4 c'4 g4 |
  b4 d'4 g'4 b'4 |
  \bar "|."
}

bassline = {
  \clef bass \key g \major \time 4/4
  \omit Score.BarNumber
  g,2 d2 |
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
