\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Consonance principle: strong beats = consonance (M3, P5, M6); weak beats = PT/NT
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % CP treble: consonance on beats 1 and 3, dissonance PT/NT on 2 and 4
      % Bar 1: M3(cons) - M2(PT) - P5(cons) - P4(PT)
      e'4 d'^\markup { "PT" } g' f'^\markup { "PT" } |
      % Bar 2: M6(cons) - M7(PT) - P8(cons) - M7(NT)
      a'4 b'^\markup { "PT" } c'' b'^\markup { "NT" } |
      % Bar 3: M6(cons) - P5(cons) - M3(cons) - M2(PT)
      a'4 g' e' d'^\markup { "PT" } |
      % Bar 4: M3(cons) - M2(PT) - P8(cons)
      e'4 d'^\markup { "PT" } c' c' |
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
