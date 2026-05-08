\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Octatonic collection in Stravinsky Firebird style
% GrandStaff: Treble = alternating m2+M2 pattern; Bass = dim7 pedal
% Oct(0,1) = {0,1,3,4,6,7,9,10} = C Db Eb E F# G A Bb
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Bar 1: octatonic ascending — alternating m2 + M2
        c'8^\markup { \tiny "Oct(0,1)" }
        des'8 ees'8 e'8 fis'8 g'8
        |
        % Bar 2: continuing + firebird-style figure
        a'8 bes'8 c''4 r4
        |
        % Bar 3: characteristic Stravinsky-style gesture from collection
        des''8 bes'8 g'8 e'8 des'8 c'8
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        % Bass: Db-E-G-Bb diminished seventh pedal (from Oct(0,1))
        <des, e, g, bes,>2.^\markup { \tiny "dim7 pedal  {1,4,6,10}" }
        |
        <des, e, g, bes,>2.
        |
        <des, e, g, bes,>2.
      }
    }
  >>
  \layout { }
}
