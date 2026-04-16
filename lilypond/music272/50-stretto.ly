\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key d \minor \time 4/4
      \omit Score.BarNumber
      r2 a'4^\markup { \small "stretto: answer enters 2 beats after subject" } bes' | c''4 d'' e'' d'' | cis''2 d''2
      \bar "|."
    }
    \new Staff {
      \clef bass \key d \minor \time 4/4
      d4 e f g | a4 g fis g | a,1
      \bar "|."
    }
  >>
  \layout { }
}
