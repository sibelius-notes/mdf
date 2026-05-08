\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Webern Op.24 Concerto row: derived from 4 [3-3] trichords
% Row: B-Bb-D-Eb | G-F#-Ab-E | F-C-Db-A
% Trichords: {11,10,2}  {3,7,6}  {8,4,5}  {0,1,9}
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 4/4
      % Trichord 1: B Bb D  {11,10,2}  [3-3]
      b'8^\markup { \tiny "① {11,10,2}" }
      bes'8 d''8 r8 r4
      \bar "|"
      % Trichord 2: Eb G F#  {3,7,6}  [3-3]
      ees''8^\markup { \tiny "② {3,7,6}" }
      g''8 fis''8 r8 r4
      \bar "|"
      % Trichord 3: Ab E F  {8,4,5}  [3-3]
      aes''8^\markup { \tiny "③ {8,4,5}" }
      e''8 f''8 r8 r4
      \bar "|"
      % Trichord 4: C Db A  {0,1,9}  [3-3]
      c''8^\markup { \tiny "④ {0,1,9}" }
      des''8 a''8 r8 r4
      \bar "|."
    }
  }
  \layout { }
}
