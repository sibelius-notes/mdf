\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Spectral chord: overtone series partials 4-11 above low C fundamental
% Partials: 4=C, 5=E, 6=G, 7=Bb(slightly flat), 8=C, 9=D, 10=E, 11=F# (raised)
% Notated as close approximation in equal temperament
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % Partials 6-11 in the treble: G3-Bb3-C4-D4-E4-F#4
  <g bes c d e fis>1^\markup { \tiny "partials 6–11" } |
  % Arpeggiate to show the spacing
  <g bes c d e fis>1 |
}
lower = \relative c, {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 4/4
  % Fundamental C + partial 5 (E)
  <c e>1_\markup { \tiny "fundamental C + partial 5 (E)" }\pp |
  % Held whole note
  c,1 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
