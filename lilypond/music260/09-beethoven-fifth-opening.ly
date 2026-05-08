\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Beethoven, Symphony No. 5 — opening 4-note G–G–G–Eb motif
% with fermata; C minor, Allegro con brio
upper = \relative c'' {
  \clef treble
  \key c \minor
  \time 2/4
  \omit Score.BarNumber
  % Iconic rest + short-short-short-long motive
  r8 g8\f g8 g8 |
  ees2\fermata |
  r8 f8 f8 f8 |
  d2\fermata |
}
lower = \relative c {
  \clef bass
  \key c \minor
  \time 2/4
  \omit Score.BarNumber
  r8 <g ees'>8\f <g ees'>8 <g ees'>8 |
  <ees bes' ees>2\fermata |
  r8 <f d'>8 <f d'>8 <f d'>8 |
  <d aes' d>2\fermata |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
