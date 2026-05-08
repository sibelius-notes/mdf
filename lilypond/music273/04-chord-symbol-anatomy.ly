\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chord symbol anatomy comparison grid: Cmaj7 / Cm7 / C7 / C7#9
% GrandStaff with annotated root/3rd/5th/7th labels
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c1:maj7 c1:m7 c1:7 c1:7.9+
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Cmaj7: C E G B — annotate each voice
        <c e g b>2^\markup { \tiny "Cmaj7" } r2 |
        % Cm7: C Eb G Bb
        <c ees g bes>2^\markup { \tiny "Cm7" } r2 |
        % C7: C E G Bb
        <c e g bes>2^\markup { \tiny "C7" } r2 |
        % C7#9: C E Bb Dis (Eb spelled as D#)
        <c e bes dis'>2^\markup { \tiny "C7♯9" } r2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        c2_\markup { \tiny "root" } r2 |
        c2_\markup { \tiny "root" } r2 |
        c2_\markup { \tiny "root" } r2 |
        c2_\markup { \tiny "root" } r2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
