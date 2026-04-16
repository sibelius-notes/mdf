\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new Staff {
    \clef treble \key g \major \time 3/4
    \omit Score.BarNumber
    %% ||: A :|| First reprise in G
    \repeat volta 2 {
      g'4^"A" a' b' | d''2.^"V (D): HC/PAC"
    }
    %% ||: B A' :|| Second reprise
    \repeat volta 2 {
      fis''4^"B" e'' d'' | a'2.^"unstable" |
      %% A' return in G
      g'4^"A'" a' b' | d''4 c''4 b'4 | g'2.^"G: PAC"
    }
  }
  \layout { }
}
