\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Truck-driver modulation: semitone key lift from C to Db at the chorus
% 4-bar verse (C major) + 4-bar chorus (Db major)

chordsVrse = \chordmode {
  \key c \major
  c1 | g1 | a1:m | f1 |
}

chordsChorus = \chordmode {
  \key des \major
  des1 | aes1 | bes1:m | ges1 |
}

melodyVrse = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  \mark \markup { \italic "C major — Verse" }
  g4 a g e |
  f4 e d2 |
  e4 f g e |
  f4 e c2 |
}

melodyChrs = \relative c'' {
  \clef treble \key des \major \time 4/4
  \omit Score.BarNumber
  \mark \markup { \italic "D\flat major — Chorus" }
  \mark \markup { \tiny \italic "(truck-driver modulation)" }
  aes4 bes aes f |
  ges4 f ees2 |
  f4 ges aes f |
  ges4 f des2 \bar "|."
}

bassVrse = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

bassChrs = \relative c {
  \clef bass \key des \major \time 4/4
  \omit Score.BarNumber
  des4 f aes2 |
  aes,4 c ees2 |
  bes4 des f2 |
  ges4 bes des2 |
}

\score {
  <<
    \new ChordNames { \chordsVrse }
    \new GrandStaff <<
      \new Staff { \melodyVrse }
      \new Staff { \bassVrse }
    >>
  >>
  \layout { }
}

\score {
  <<
    \new ChordNames { \chordsChorus }
    \new GrandStaff <<
      \new Staff { \melodyChrs }
      \new Staff { \bassChrs }
    >>
  >>
  \layout { }
}
