\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Groove bass line: syncopated bass with sustained melodic long tones above
% Treble = whole/half note melody; Bass = syncopated groove

chordsGroove = \chordmode {
  c1 | f1 | c1 | g1 |
}

% Sustained long tones — let the bass groove carry the energy
melodyGroove = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g1 |
  a1 |
  g2 e2 |
  f1 \bar "|."
}

% Syncopated Afro-Cuban-inflected groove bass
bassGroove = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 c8 c~ c8 c16 c c4 |
  f4 f8 f~ f8 f16 f f4 |
  c4 c8 c~ c8 g'16 g g4 |
  g,4 g8 g~ g8 d'16 d d4 |
}

\score {
  <<
    \new ChordNames { \chordsGroove }
    \new GrandStaff <<
      \new Staff { \melodyGroove }
      \new Staff { \bassGroove }
    >>
  >>
  \layout { }
}
