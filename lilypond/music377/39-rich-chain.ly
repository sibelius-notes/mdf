\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% RI-chain: P0→RI10→P0 — Webern Op.27 style
% Each adjacent hexachord pair shares 5 common tones
% Common tone connections annotated
\score {
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c'' {
      \time 4/4
      % P0 first hexachord: C B Eb E Ab G
      c'8^\markup { \tiny "P₀ hex1" }
      b8 ees'8 e'8 aes'8 g'8 r4
      |
      % RI10 first hexachord: Bb A C# D F# F (shares 5 PCs with P0 hex2)
      bes'8^\markup { \tiny "RI₁₀ hex1" }
      a'8 cis''8 d''8 fis''8 f''8 r4
      |
      % P0 second hexachord: A F# D Db F Bb
      a'8^\markup { \tiny "P₀ hex2" }
      fis'8 d'8 des'8 f'8 bes'8 r4
      |
      % RI10 second hexachord (chain closes): links back
      g8^\markup { \tiny "RI₁₀ hex2  (chain ↺)" }
      aes8 e'8 ees'8 b8 c'8 r4
    }
  }
  \layout { }
}
