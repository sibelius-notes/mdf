\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Zarlino's senario (Le Istitutioni harmoniche, 1558):
% Ratios 1–6 generate all consonances; each dyad above sustained bass C
% P8 2:1, P5 3:2, P4 4:3, M3 5:4, m3 6:5 — shown as half-note dyads
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      c''2^\markup { \small "2:1  P8" } c''2 |
      g'2^\markup { \small "3:2  P5" } g'2 |
      f'2^\markup { \small "4:3  P4" } f'2 |
      e'2^\markup { \small "5:4  M3" } e'2 |
      ees'2^\markup { \small "6:5  m3" } ees'2 \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      \omit Score.BarNumber
      c2_\markup { \small "C (1)" } c2 |
      c2 c2 |
      c2 c2 |
      c2 c2 |
      c2_\markup { \italic \small "senario" } c2
    }
  >>
  \layout { }
}
