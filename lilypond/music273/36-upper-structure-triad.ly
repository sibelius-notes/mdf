\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% G7alt with Ab major upper-structure triad over G7 shell: 4 bars comping
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        g1:7.9-.13- g1:7.9-.13- g1:7.9-.13- g1:7.9-.13-
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Treble: Ab major triad (Ab-C-Eb = b9, 3rd, b13 of G7)
        <aes' c'' ees''>2^\markup { \tiny "A♭ triad = UST" } <aes' c'' ees''>2 |
        <aes' c'' ees''>2 <aes' c'' ees''>2 |
        <aes' c'' ees''>2 <c'' ees''>2 |
        <aes' c'' ees''>1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Bass: G7 shell voicing (G B F)
        <g, b, f>2^\markup { \tiny "G7 shell" } <g, b, f>2 |
        <g, b, f>2 <g, b, f>2 |
        <g, b, f>2 <g, b, f>2 |
        <g, b, f>1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
