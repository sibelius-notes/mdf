\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Lippius's trias harmonica (Synopsis Musicae Novae, 1612):
% The harmonic triad in root, first, and second inversion with figured bass
% "Lippius first systematized chord inversion"
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g'>2^\markup {
        \column { \small "radix = C" \small "5/3" }
      }
      <e' g' c''>2^\markup {
        \column { \small "6/3" \small "1st inv." }
      }
      <g' c'' e''>2^\markup {
        \column { \small "6/4" \small "2nd inv." }
      }
      <c' e' g'>2^\markup { \small "radix" }
    }
    \new FiguredBass {
      \figuremode {
        <5 3>2 <6 3>2 <6 4>2 <5 3>2
      }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2_\markup { \small "C" }
      e2_\markup { \small "E" }
      g,2_\markup { \small "G" }
      c2_\markup { \italic \small "trias harmonica" }
    }
  >>
  \header { piece = \markup { \small "Lippius 1612: trias harmonica" } }
  \layout { }
}
