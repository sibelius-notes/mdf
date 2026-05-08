\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Verse: conjunct stepwise motion, conversational register, I-IV-I-V

chordsVerse = \chordmode {
  c1 | f1 | c1 | g1 |
}

melodyVerse = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  e4 f g e |
  f4 g a f |
  e4 d c d |
  e2 d2 \bar "|."
}

bassVerse = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  f4 a c2 |
  c,4 e g2 |
  g,4 b d2 |
}

\score {
  <<
    \new ChordNames { \chordsVerse }
    \new GrandStaff <<
      \new Staff { \melodyVerse }
      \new Staff { \bassVerse }
    >>
  >>
  \layout { }
}
