% Country I–IV–V–I in G: the core three-chord country progression. "Take Me Home, Country Roads", "Friends in Low Places". Pentatonic melody over open fifth bass.
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  g1 c1 d1 g1
}

melody = {
  \clef treble \key g \major \time 4/4
  \omit Score.BarNumber
  d'4 g'4 b'4 g'4 |
  e'4 g'4 c''4 e'4 |
  fis'4 a'4 d''4 a'4 |
  g'4 b'4 d''4 g'4 |
  \bar "|."
}

bassline = {
  \clef bass \key g \major \time 4/4
  \omit Score.BarNumber
  g,2 d2 |
  c2 g,2 |
  d2 a,2 |
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
