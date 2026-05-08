\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Stride piano left hand: bass note + chord, 4 bars in F major
\score {
  \new Staff {
    \clef bass \key f \major \time 4/4 \omit Score.BarNumber
    \tempo "Moderato stride"
    % Bar 1: F stride
    f,4_\markup { \tiny "F" }
    <a c' f'>4_\markup { \tiny "F" }
    f,4
    <a c' f'>4 |
    % Bar 2: Bb stride
    bes,,4_\markup { \tiny "Bb" }
    <f bes d'>4_\markup { \tiny "Bb" }
    bes,,4
    <f bes d'>4 |
    % Bar 3: C7 stride
    c,4_\markup { \tiny "C7" }
    <e bes c'>4_\markup { \tiny "C7" }
    c,4
    <e bes c'>4 |
    % Bar 4: F stride
    f,4_\markup { \tiny "F" }
    <a c' f'>4
    f,4
    <a c' f'>4 |
  }
  \layout { }
}
