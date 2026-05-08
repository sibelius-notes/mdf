\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% Arrangement layering: 3 staves show melody, rhythm guitar comping, bass guitar
% 4 bars of I-V-vi-IV in C major

chordsArr = \chordmode {
  c1 | g1 | a1:m | f1 |
}

melodyArr = \relative c'' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  g4 c8 b a4 g |
  f4 e d c8 d |
  e4 a8 g~ g4 f8 e |
  f4 e d2 \bar "|."
}

% Rhythm guitar: strummed chord voicings (on-beat quarter chords)
rhyGtr = \relative c' {
  \clef treble \key c \major \time 4/4
  \omit Score.BarNumber
  <c e g>4 <c e g> <c e g> <c e g> |
  <g b d>4 <g b d> <g b d> <g b d> |
  <a c e>4 <a c e> <a c e> <a c e> |
  <f a c>4 <f a c> <f a c> <f a c> |
}

% Bass guitar: root-fifth walking pattern
bassArr = \relative c {
  \clef bass \key c \major \time 4/4
  \omit Score.BarNumber
  c4 g' c, g' |
  g,4 d' g, d' |
  a4 e' a, e' |
  f4 c' f, c' |
}

\score {
  <<
    \new ChordNames { \chordsArr }
    \new StaffGroup <<
      \new Staff \with { instrumentName = \markup { \small "Lead" } }
        { \melodyArr }
      \new Staff \with { instrumentName = \markup { \small "Rhythm" } }
        { \rhyGtr }
      \new Staff \with { instrumentName = \markup { \small "Bass" } }
        { \bassArr }
    >>
  >>
  \layout { }
}
