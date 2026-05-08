\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Pierrot Lunaire analysis: B-G#-G {11,8,7} in dotted/syncopated rhythm
% [3-11] and [3-3] alternating over 2 bars
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c''' {
      \time 4/4
      % Bar 1: B-G#-G in dotted-8th/16th rhythm (Pierrot Mondestrunken style)
      b'4.^\markup { \tiny "{11,8,7} [3-3]" }
      gis'8~ gis'8 g'8 r4
      |
      % Bar 2: continuation — [3-11] minor triad (E G B) then [3-3] returns
      e'8.^\markup { \tiny "{4,7,11} [3-11]" }
      g'16~ g'8 b'8~ b'4 r4
      |
      % Bar 3: [3-3] in new transposition: Eb-E-Ab T₃(014) — syncopated
      r8 ees'8^\markup { \tiny "[3-3] T₃" }
      e'4. aes'8 r4
      |
      % Bar 4: [3-11] closing gesture
      r4
      <e' g' b'>4^\markup { \tiny "[3-11]" }
      r2
    }
  }
  \layout { }
}
