\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Chaconne: ground bass (C minor descending) + first variation in treble
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \minor \time 4/4 \omit Score.BarNumber
      % First variation: simple melodic figure over each harmony
      % Bar 1 I(cm): c''–b'–aes'–g'
      c''4 b'4 aes'4 g'4 |
      % Bar 2 V(G): d''–c''–b'–g'
      d''4 c''4 b'4 g'4 |
      % Bar 3 bIII(Eb): ees''–d''–c''–b'
      ees''4 d''4 c''4 b'4 |
      % Bar 4 bVII(Bb): bes'–aes'–g'–f'
      bes'4 aes'4 g'4 f'4 |
      % Bar 5 bVI(Ab): aes'–bes'–c''–ees''
      aes'4 bes'4 c''4 ees''4 |
      % Bar 6 I(cm): g'–aes'–bes'–c''
      g'4 aes'4 bes'4 c''4 |
      % Bar 7 IV(fm): f'–g'–aes'–bes'
      f'4 g'4 aes'4 bes'4 |
      % Bar 8 V(G): d''–f'–g'–g'
      d''4 f'4 g'2 |
    }
    \new Staff {
      \clef bass \key c \minor \time 4/4 \omit Score.BarNumber
      % Ground bass: descending I–V–bIII–bVII–bVI–I–IV–V
      c2_"I" c2 |
      g,2_"V" g,2 |
      ees2_"♭III" ees2 |
      bes,2_"♭VII" bes,2 |
      aes,2_"♭VI" aes,2 |
      c2_"I" c2 |
      f2_"IV" f2 |
      g2_"V" g2 |
    }
  >>
  \layout { }
}
