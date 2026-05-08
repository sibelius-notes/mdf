\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Weber's secondary dominant notation (Versuch, 1817-1821): I–V₇/V–V₇–I in C
% GrandStaff with soprano voice leading; Weber-style Roman numerals
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      % I = C major
      <c' e' g'>2^\markup { \small "I" } <c' e' g'>2 |
      % V7/V = D dominant 7th (secondary dominant of G)
      <d' fis' a' c''>2^\markup { \small "V₇/V" } <d' fis' a' c''>2 |
      % V7 = G dominant 7th
      <g b d' f'>2^\markup { \small "V₇" } <g b d' f'>2 |
      % I = C major resolution
      <c' e' g'>1^\markup { \small "I" }
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      \omit Score.BarNumber
      c2_\markup { \small "C" } c2 |
      d2_\markup { \small "D" } d2 |
      g,2_\markup { \small "G" } g,2 |
      c2_\markup { \small "C" } c2
    }
  >>
  \layout { }
}
