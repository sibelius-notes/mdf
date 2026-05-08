\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Stravinsky Augurs of Spring: Eb major over E dominant 7th
% Added: ff quarter-note "wrong-note" accent in top voice
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c''' {
        \time 4/4
        % Eb major triad with ff accent on the "wrong" downbeat
        ees''4\ff^\markup { \tiny "E♭ major" }
        g''4 bes''4 r4
        |
        % Second bar: accent repeated — characteristic Stravinsky rhythm
        ees''4\ff-> g''4 bes''4 r4
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c, {
        \time 4/4
        % E dominant 7th in bass: E G# B D  {4,8,11,2}
        <e, gis, b, d>2.^\markup { \tiny "E dom7  {4,8,11,2}" }
        r4
        |
        <e, gis, b, d>2.
        r4
      }
    }
  >>
  \layout { }
}
