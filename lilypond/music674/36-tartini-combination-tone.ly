\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Tartini's terzo suono (1754): difference tone produced by two simultaneous pitches
% Treble = two-voice perfect fifth G+D (playing G=196Hz, D=294Hz)
% Bass = difference tone C (294−196 = 98Hz ≈ C2): the "third sound"
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % 4 bars of sustained fifth in eighth-note pairs (bowing/breath context)
      <g' d''>4^\markup { \small "G+D (196+294 Hz)" }
      <g' d''>4 <g' d''>4 <g' d''>4 |
      <g' d''>4 <g' d''>4 <g' d''>4 <g' d''>4 |
      <g' d''>4 <g' d''>4 <g' d''>4 <g' d''>4 |
      <g' d''>2^\markup { \small "P5: 3:2 ratio" }
      <g' d''>2
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c,1^\markup { \small "terzo suono: 294−196 = 98 Hz ≈ C₂" }
      c,1
      c,1
      c,1_\markup { \small "Tartini: Del Trattato di Musica (1754)" }
    }
  >>
  \layout { }
}
