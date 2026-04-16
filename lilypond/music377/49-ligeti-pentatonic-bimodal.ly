\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % Ligeti Désordre: white-key pentatonic (RH) vs black-key pentatonic (LH)
  % RH: {0,2,4,7,9} = C D E G A
  % LH: {1,3,6,8,10} = Db Eb F# Ab Bb
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        c'8^\markup { \tiny "RH [5-35]" } d' e' g' a' c'' d'' e'' g'' a''
        r4.
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        des8^\markup { \tiny "LH [5-35] T₆" } ees fis aes bes des' ees' fis' aes' bes'
        r4.
      }
    }
  >>
  \layout { }
}
