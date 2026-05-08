\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Ligeti Désordre: RH white-key pentatonic vs LH black-key pentatonic
% Flowing 16th notes in RH over LH held notes
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % RH: flowing 16th note pentatonic pattern {0,2,4,7,9}
        c'16^\markup { \tiny "RH [5-35] {0,2,4,7,9}" }
        d'16 e'16 g'16
        a'16 c''16 d''16 e''16~
        e''8 g''8 a''8 r8
        |
        c'16 d'16 e'16 g'16
        a'16 c''16 d''16 e''16
        g''4 r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % LH: black-key pentatonic held notes {1,3,6,8,10}
        <des, ees, fis, aes, bes,>2^\markup { \tiny "LH [5-35] T₆ {1,3,6,8,10}" }
        <des, ees, fis, aes, bes,>2
        |
        <des, ees, fis, aes, bes,>2
        <des, ees, fis, aes, bes,>2
      }
    }
  >>
  \layout { }
}
