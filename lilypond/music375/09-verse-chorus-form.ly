\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Verse–Chorus form: 8 bars. Verse = minor feel (i-iv), Chorus = major (I-V-vi-IV)

chordsVC = \chordmode {
  % Verse: a minor feel
  a1:m | d1:m | a1:m | e1 |
  % Chorus: C major
  c1 | g1 | a1:m | f1 |
}

melodyVC = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  % Verse: lower, conjunct
  \mark \markup { \bold "Verse" }
  a4 b c a |
  d4 c b a |
  a4 g a b |
  e2 e2 |
  % Chorus: upper, arch, peak on first beat
  \mark \markup { \bold "Chorus" }
  c''4 b a g |
  b4 a g f |
  a4 g f e |
  d4 e c2 \bar "|."
}

bassVC = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  a4 c e2 |
  d4 f a2 |
  a,4 c e2 |
  e,4 gis b2 |
  c4 e g2 |
  g,4 b d2 |
  a4 c e2 |
  f4 a c2 |
}

\score {
  <<
    \new ChordNames { \chordsVC }
    \new GrandStaff <<
      \new Staff { \melodyVC }
      \new Staff { \bassVC }
    >>
  >>
  \layout { }
}
