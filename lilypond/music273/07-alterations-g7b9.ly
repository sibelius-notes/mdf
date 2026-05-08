\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7b9 → G7#9 → G7b13 comparison on GrandStaff, 3 bars with annotations
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g1:7.9- g1:7.9+ g1:7.13-
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % G7b9: Ab is b9 — harsh minor ninth above root
        <b f' aes'>2^\markup { \tiny "G7♭9: Ab" } <b f' aes'>2 |
        % G7#9: Bb is #9 — the "Hendrix chord" color
        <b f' bes'>2^\markup { \tiny "G7♯9: B♭" } <b f' bes'>2 |
        % G7b13: Eb is b13 — same as #5, dark dominant
        <b f' ees''>2^\markup { \tiny "G7♭13: E♭" } <b f' ees''>2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        g2_\markup { \tiny "♭9" } d2 |
        g2_\markup { \tiny "♯9" } d2 |
        g2_\markup { \tiny "♭13" } d2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
