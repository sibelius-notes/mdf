\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Pythagorean consonances as simultaneous dyads with ratio labels
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % unison 1:1, octave 2:1, fifth 3:2, fourth 4:3
    <c' c'>1^\markup { \small "1:1 unison" }
    <c' c''>1^\markup { \small "2:1 octave" }
    <c' g'>1^\markup { \small "3:2 fifth" }
    <c' f'>1^\markup { \small "4:3 fourth" }
  }
  \layout { }
}
