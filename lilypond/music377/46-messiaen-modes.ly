\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Messiaen Mode 2 (octatonic) vs Mode 3 comparison
% Each mode shown as 2-bar Messiaen-style piano texture: parallel triads/stacked 3rds in 3/4
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Mode 2 / Oct(0,1): parallel diminished triad chords Messiaen-style
        <c' ees' fis'>4^\markup { \tiny "Mode 2 / Oct(0,1)" }
        <des' e' g'>4
        <ees' fis' a'>4
        |
        <e' g' bes'>4
        <fis' aes' b'>4
        <g' a' c''>4
        \bar "||"
        % Mode 3: {0,2,3,4,6,7,8,10,11} — 3-note groups (M2+m2+m2)
        <c' d' ees'>4^\markup { \tiny "Mode 3" }
        <e' fis' g'>4
        <aes' bes' b'>4
        |
        <c'' d'' ees''>4
        r2
        \bar "|."
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 3/4
        % Mode 2 bass: octatonic bass line
        <c, ees, g,>4
        <des, e, aes,>4
        <ees, fis, bes,>4
        |
        <e, g, b,>4
        r2
        \bar "||"
        % Mode 3 bass: mode 3 bass line
        <c, e, aes,>4
        <d, fis, a,>4
        <ees, g, bes,>4
        |
        <c, e, aes,>4
        r2
        \bar "|."
      }
    }
  >>
  \layout { }
}
