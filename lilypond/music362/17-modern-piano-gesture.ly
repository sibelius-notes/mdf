\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Modern percussive piano gesture: staccato, dissonant 2nds and 7ths
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \omit Score.BarNumber \time 4/4
      \tempo "Toccata-like"
      % Dissonant 2nds, sharp staccato
      <c' d'>4-.\ff <fis' g'>4-. <b' c''>4-. <ees'' f''>4-. |
      <a' bes'>4-.\mf r4 <d'' ees''>4-.\ff r4 |
      <c' b>4-. <fis g>4-. <d' cis'>4-. <aes bes>4-. |
      r4\p <b, c>4-.\ff r4 <fis g>4-.\fff |
    }
    \new Staff {
      \clef bass \omit Score.BarNumber \time 4/4
      % Low staccato punctuation
      c,4-.\ff fis,4-. b,,4-. ees,4-. |
      aes,,4-.\mf r4 d,4-.\ff r4 |
      g,,4-. cis,4-. fis,,4-. bes,,4-. |
      r4\p e,,4-.\ff r4 b,,,4-.\fff |
    }
  >>
  \layout { }
}
