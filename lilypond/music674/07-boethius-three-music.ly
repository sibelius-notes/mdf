\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Boethius: three kinds of music (De Institutione Musica, c. 500 CE)
% Three staves contrasting musica mundana, humana, and instrumentalis
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup { \small "Mundana" } } {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Musica mundana: cosmic intervals — octave + fifth (celestial proportions)
      c'1^\markup { \small "musica mundana: cosmos, planets, seasons" }
      g'1
      c''1
      g''1
    }
    \new Staff \with { instrumentName = \markup { \small "Humana" } } {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Musica humana: soul-body harmony — triadic, introverted
      <c' e' g'>1^\markup { \small "musica humana: soul and body in concord" }
      <c' e' g'>1
      <d' f' a'>1
      <c' e' g'>1
    }
    \new Staff \with { instrumentName = \markup { \small "Instrumentalis" } } {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Musica instrumentalis: actual heard music — a simple phrase
      c'4^\markup { \small "musica instrumentalis: sounding, audible music" }
      d'4 e'4 f'4 |
      g'2 e'2 |
      f'4 e'4 d'4 c'4 |
      c'1
    }
  >>
  \layout { }
}
