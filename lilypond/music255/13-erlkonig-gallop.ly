\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schubert "Erlkönig" D. 328 — galloping triplet ostinato in the piano right hand
% over a bass octave pulse; D minor, fierce presto character
upper = \relative c'' {
  \clef treble
  \key d \minor
  \time 4/4
  \omit Score.BarNumber
  % right hand: relentless triplet 8th-note ostinato
  \tuplet 3/2 { d8 f d } \tuplet 3/2 { d8 f d }
  \tuplet 3/2 { d8 f d } \tuplet 3/2 { d8 f d } |
  \tuplet 3/2 { e8 g e } \tuplet 3/2 { e8 g e }
  \tuplet 3/2 { e8 g e } \tuplet 3/2 { e8 g e } |
  \tuplet 3/2 { f8 a f } \tuplet 3/2 { f8 a f }
  \tuplet 3/2 { e8 g e } \tuplet 3/2 { e8 g e } |
  \tuplet 3/2 { d8 f d } \tuplet 3/2 { d8 f d }
  d2_\markup { \tiny "galloping triplet ostinato" } |
}
lower = \relative c {
  \clef bass
  \key d \minor
  \time 4/4
  \omit Score.BarNumber
  % left hand: octave bass pulse on every beat — the horse's hoofbeats
  d8\f d' d d d d d d |
  e,8 e' e e e e e e |
  f,8 f' f f e, e' e e |
  d,8 d' d d d2 |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
