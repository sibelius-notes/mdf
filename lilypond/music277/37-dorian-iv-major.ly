% Dorian i–IV–i–v in D: the major IV (G major) chord is the Dorian fingerprint — the raised 6th (B♮) distinguishes it from natural minor (which would have Gm). "So What" (Miles Davis), "Oye Como Va" (Santana).
\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }

harmScheme = \chordmode {
  \set chordChanges = ##t
  d1:m g1 d1:m a1:m
}

melody = {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  d'4 f'4 a'4 d''4 |
  b'4 g'4 d'4 e'4 |
  f'4 a'4 d''4 c''4 |
  e'4 c'4 a4 d'4 |
  \bar "|."
}

bassline = {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  d2 a,2 |
  g,2 d2 |
  d2 a,2 |
  a,2 e2 |
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
