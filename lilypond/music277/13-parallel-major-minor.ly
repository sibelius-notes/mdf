% Parallel major/minor mixture: I → i → bVI → V7. The Eb (bar 2) and Ab (bar 3) are borrowed from C minor/Eb major. "Oh! Darling", "Norwegian Wood".
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  c1 c1:m aes1 g1:7
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e'4 g'4 c''4 g'4 |
  ees'4 g'4 c''4 ees'4 |
  ees'4 c'4 aes'4 ees'4 |
  d'4 f'4 b4 d'4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c2 g,2 |
  c2 g,2 |
  aes,2 ees2 |
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
