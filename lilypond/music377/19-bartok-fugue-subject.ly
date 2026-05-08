\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bartók Music for Strings, Perc & Celesta: fugue subject (chromatic wedge)
% Full rhythmic context: viola/cello alto clef, 4 bars, with slur markings
\score {
  \new Staff \with { \omit KeySignature } {
    \clef alto
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      \time 4/4
      % Bar 1: A upbeat → stepwise wedge outward from A
      a4( bes4 aes4 b4
      |
      % Bar 2: continuing chromatic wedge expansion
      g4 c'4 fis4) r4
      |
      % Bar 3: second limb — wider wedge: E-D-F#-Eb
      r4 ( e4 d4 fis4
      |
      % Bar 4: ees cis g - approach to climax
      ees4 cis4 g4) r4
    }
  }
  \layout { }
}
