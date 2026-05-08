\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% 8-bar comping study: Dm9-G13-Cmaj9-Cmaj9 x2 in half-note charleston rhythm
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        d2:m9 g2:13 c2:maj9 c2:maj9
        d2:m9 g2:13 c2:maj9 c2:maj9
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Rootless voicings: charleston rhythm (half + half)
        % Dm9 rootless: F A C E; G13 rootless: F B E; Cmaj9 rootless: B E G D
        <f a c' e'>2^\markup { \tiny "Dm9 rootless" } <f b e'>2^\markup { \tiny "G13 rootless" } |
        <b e' g' d''>2^\markup { \tiny "Cmaj9 rootless" } <b e' g' d''>2 |
        <f a c' e'>2 <f b e'>2 |
        <b e' g' d''>2 <b e' g' d''>2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        % Bass: roots on beat 1 only
        d2 g,2 |
        c2 r2 |
        d2 g,2 |
        c1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
