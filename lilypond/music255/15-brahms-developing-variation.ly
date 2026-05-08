\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Brahms "developing variation": 4-bar phrase + 4-bar variant
% with rhythmic displacement (syncopation) — a hallmark of Brahms's technique
upper = \relative c'' {
  \clef treble
  \key f \major
  \time 3/4
  \omit Score.BarNumber
  % Phrase A: regular, periodic
  f4^\markup { \bold "(a) phrase" } a4 c4 |
  c4 bes4 a4 |
  g4( f4) e4 |
  f2.~ |
  % Phrase A': developing variation — displacement by half-beat, chromatic tail
  f4^\markup { \bold "(a') variant" }~ f8 a8~ a4 |
  c8 bes4.~ bes8 a8 |
  g4~ g8 fis8 g4 |
  f2.~ |
}
lower = \relative c {
  \clef bass
  \key f \major
  \time 3/4
  \omit Score.BarNumber
  f4\mp a4 c4 |
  f,4 g4 a4 |
  c,4 c4 c4 |
  f2. |
  % displaced accompaniment in variant — off-beat sfz accents
  f4\> a4 c4\! |
  f,4 bes4 bes4 |
  c,4\< c4 cis4\! |
  f2. |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
