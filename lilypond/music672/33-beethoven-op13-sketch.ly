\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Example 6.1 — Beethoven Op. 13 slow movement sketch (A-flat major, 5̂ primary tone)
% Initial ascent 1̂→2̂→3̂→5̂, then Urlinie descent with interruption
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key aes \major \time 4/4 \omit Score.BarNumber
      % Initial ascent: aes'→bes'→c''→(ees'')
      aes'4_"1̂" bes'4_"2̂" c''4_"3̂" ees''4^"5̂ Kopfton"
      % Urlinie starts: 5̂ prolonged
      ees''1^"5̂"
      % Descent: 5̂–4̂–3̂–2̂ (interrupted)
      ees''2^"5̂" des''2^"4̂"
      c''2^"3̂" bes'2^"2̂ |"
      % Second half: restart and complete
      ees''2^"5̂" des''2^"4̂"
      c''2^"3̂" bes'2^"2̂"
      aes'1^"1̂"
    }
    \new Staff {
      \clef bass \key aes \major \time 4/4 \omit Score.BarNumber
      aes,,4 aes,,4 aes,,4 aes,,4
      aes,,1_"I"
      aes,,2 aes,,2
      ees,,2 ees,,2_"V"
      aes,,2_"I" aes,,2
      ees,,2 ees,,2_"V"
      aes,,1_"I"
    }
  >>
  \layout { }
}
