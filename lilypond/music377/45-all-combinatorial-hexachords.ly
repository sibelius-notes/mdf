\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Three most important all-combinatorial hexachords: melody + complement in bass
% [6-1] (012345), [6-7] (012678), [6-20] (014589)

\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % [6-1] (012345): C Db D Eb E F — chromatic hexachord melody
        c'8^\markup { \tiny "[6-1] (012345)" }
        des'8 d'8 ees'8 e'8 f'8
        |
        % [6-7] (012678): C Db D F# G Ab — melody
        c'8^\markup { \tiny "[6-7] (012678)" }
        des'8 d'8 fis'8 g'8 aes'8
        |
        % [6-20] (014589): C Db E F Ab A — hexatonic hexachord
        c'8^\markup { \tiny "[6-20] (014589)" }
        des'8 e'8 f'8 aes'8 a'8
        |
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        % Complement of [6-1]: Gb G Ab A Bb B  {6,7,8,9,10,11}
        fis8^\markup { \tiny "complement" }
        g8 aes8 a8 bes8 b8
        |
        % Complement of [6-7]: Eb E F A Bb B  {3,4,5,9,10,11}
        ees8^\markup { \tiny "complement" }
        e8 f8 a8 bes8 b8
        |
        % Complement of [6-20]: D Eb F# G Bb B  {2,3,6,7,10,11}
        d8^\markup { \tiny "complement" }
        ees8 fis8 g8 bes8 b8
        |
      }
    }
  >>
  \layout { }
}
