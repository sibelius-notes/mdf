\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% The 24-element TI group: 4 forms of {3,4,8} = Eb,E,Ab in succession
% T0, T4, I3, T4I — Schoenberg-style atonal passage
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 4/4
      % T0 of {3,4,8}: Eb E Ab
      ees'8^\markup { \tiny "T₀{3,4,8}" }
      e'8 aes'4 r4 r4
      |
      % T4 of {3,4,8}: G Ab C  {7,8,0}
      g'8^\markup { \tiny "T₄{3,4,8}" }
      aes'8 c''4 r4 r4
      |
      % I3 of {3,4,8}: I₃{3}=0(C), I₃{4}=11(B), I₃{8}=7(G)  → {0,11,7}
      c'8^\markup { \tiny "I₃{3,4,8}" }
      b8 g4 r4 r4
      |
      % T4I = T4 applied to I0: {3+4,4+4,8+4}= I₄{3,4,8}
      % I₄{3}=1(Db), I₄{4}=0(C), I₄{8}=8(Ab) → {1,0,8}
      des'8^\markup { \tiny "T₄I{3,4,8}" }
      c'8 aes'4 r4 r4
      |
    }
  }
  \layout { }
}
