\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Rameau's chord inversion theory (Traité de l'harmonie, 1722):
% root position, first inversion, second inversion — all sharing the same fundamental bass
% 4 staves: treble triads | figured bass | Rameau's fundamental bass | Roman numerals
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g'>2^\markup { \small "root (5/3)" }
      <e' g' c''>2^\markup { \small "1st inv. (6/3)" }
      <g' c'' e''>2^\markup { \small "2nd inv. (6/4)" }
      <c' e' g'>2^\markup { \small "root (5/3)" }
    }
    \new FiguredBass {
      \figuremode {
        <5 3>2 <6 3>2 <6 4>2 <5 3>2
      }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2 e2 g2 c2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Rameau's basse fondamentale — always the root
      c,2_\markup { \small "I" }
      c,2_\markup { \small "I" }
      c,2_\markup { \small "I" }
      c,2_\markup { \small "I" }
    }
  >>
  \layout { }
}
