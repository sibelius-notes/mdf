\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Blue notes: b3 (Eb over C) and b5 (Gb over C) in a pop/R&B context
% C7 comping in bass (C-E-G-Bb)

chordsBlue = \chordmode {
  c1:7 | c1:7 | c1:7 | c1:7 |
}

% Melody features Eb (b3) and Gb (b5) as expressive blue notes
melodyBlue = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 ees8 c~ c4 g'8 bes~ |
  bes4 g8 ees~ ees4 d |
  g4 ges8 ees~ ees4 c |
  g'4 f ees2 \bar "|."
}

% C7 chord voicing: C-E-G-Bb
bassBlue = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c8 e g bes c,8 e g bes |
  c,8 e g bes c,8 e g bes |
  c,8 e g bes c,8 e g bes |
  c,8 e g bes c,4 r |
}

\score {
  <<
    \new ChordNames { \chordsBlue }
    \new GrandStaff <<
      \new Staff { \melodyBlue }
      \new Staff { \bassBlue }
    >>
  >>
  \layout { }
}
