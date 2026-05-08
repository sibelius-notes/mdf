\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Dissonances as passing tones: M2 and m7 off the beat, never on strong beats
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % CP in treble: consonances on beats 1 and 3; dissonances as passing tones
      % Bar 1: e'(M3) - d'(PT: M2) - c'(unison) - e'(M3)
      e'4 d'^\markup { "PT" } c' e' |
      % Bar 2: g'(P5) - a'(M6) - b'(M7 PT) - c''(P8)
      g'4 a' b'^\markup { "PT" } c'' |
      % Bar 3: e''(M3) - d''(PT: M2) - c''(P8) - b'(M7 PT)
      e''4 d''^\markup { "PT" } c'' b'^\markup { "PT" } |
      % Bar 4: a'(M6) - g'(P5) - e'(M3) - c'(P8 octave below)
      a'4 g' e' c' |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % CF in bass: whole notes
      c1 |
      c1 |
      c1 |
      c1 |
    }
  >>
  \layout { }
}
