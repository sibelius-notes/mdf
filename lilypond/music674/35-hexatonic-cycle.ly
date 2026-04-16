\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Neo-Riemannian hexatonic cycle (Cohn): C maj → P → C min → L → Ab maj → P → Ab min → L → E maj → P → E min → L → C maj
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    <c' e' g'>2^\markup { \small "C+" }
    <c' ees' g'>2^\markup { \small "c−" }
    <aes' c'' ees''>2^\markup { \small "A♭+" }
    <aes' ces'' ees''>2^\markup { \small "a♭−" }
    <e' gis' b'>2^\markup { \small "E+" }
    <e' g' b'>2^\markup { \small "e−" }
    <c' e' g'>1^\markup { \small "C+ (cycle)" }
  }
  \layout { }
}
