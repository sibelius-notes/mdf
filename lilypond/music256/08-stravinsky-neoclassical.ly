\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Stravinsky neoclassical "wrong-note" style — C major with chromatic intrusions
upper = \relative c'' {
  \clef treble
  \key c \major
  \omit Score.BarNumber
  \time 4/4
  % bar 1 — crisp C major quarter notes, mock-Baroque
  c4^\markup { \italic "Pulcinella: neoclassicism + irony" } e g e |
  % bar 2 — "wrong note": Bb intrusion
  f4 a bes!4\sf c |
  % bar 3 — back to diatonic but another wrong note
  d4 b g fis!\sf |
  % bar 4 — cadence with added chromatic
  e4 f g <c e g>4 |
}
lower = \relative c {
  \clef bass
  \key c \major
  \omit Score.BarNumber
  \time 4/4
  % clear 2-part Baroque texture
  c4 c' g e |
  f4 f g g |
  d4 g, d' b, |
  c4 f g c, |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
