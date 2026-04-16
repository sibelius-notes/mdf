\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
\score {
  % [3-5] (016): "split" trichord from Webern Op.5 No.4
  % {0,1,6}: C Db Gb; transpositions {1,6,7}: Db Gb G; {2,7,8}: D G Ab
  \new Staff \with { \omit KeySignature } {
    \clef treble
    \omit Score.BarNumber
    \override Staff.TimeSignature.stencil = ##f
    \relative c' {
      <c' des' fis'>1^\markup { \tiny "{0,1,6} [3-5] (016)" }
      <des' fis' g'>1^\markup { \tiny "{1,6,7}" }
      <d' g' aes'>1^\markup { \tiny "{2,7,8}" }
    }
  }
  \layout { }
}
