\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Messiaen Mode 2 (octatonic): C-Db-Eb-E-F#-G-A-Bb
upper = \relative c'' {
  \clef treble
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 3/4
  % parallel chords in Mode 2 — stacked thirds (C-Eb-G-A pattern)
  <c es g a>4^\markup { \small "Mode 2: limited transposition oct(0,1)" }
   <c es g a> <c es g a> |
  % shift the chord up by semitone (limited transposition property)
  <des e as bes>4 <des e as bes> <des e as bes> |
  % back to C octatonic level
  <c es g a>4 <c es g a> <c es g a> |
  % final bar with octatonic run
  <c es g a>2. |
}
lower = \relative c {
  \clef bass
  \omit Staff.KeySignature
  \omit Score.BarNumber
  \time 3/4
  % octatonic bass line: C-Db-Eb-E-F#-G...
  c4 des es |
  e4 fis g |
  a4 bes c |
  c2. |
}
\score {
  \new GrandStaff <<
    \new Staff \upper
    \new Staff \lower
  >>
  \layout { }
}
