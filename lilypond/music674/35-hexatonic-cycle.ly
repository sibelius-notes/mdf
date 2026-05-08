\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Neo-Riemannian hexatonic cycle (Cohn 1996): 6 triads connected by P and L operations
% C+ → P → c− → L → Ab+ → P → ab− → L → E+ → P → e− → (L back to C+)
% GrandStaff with smooth soprano voice leading throughout
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      <c' e' g'>2^\markup { \small "C+ " }
      <c' ees' g'>2^\markup { \small "P→ c−" } |
      <aes' c'' ees''>2^\markup { \small "L→ A♭+" }
      <aes' ces'' ees''>2^\markup { \small "P→ a♭−" } |
      <gis' b' e''>2^\markup { \small "L→ E+" }
      <e' g' b'>2^\markup { \small "P→ e−" } |
      <c' e' g'>1^\markup { \small "L→ C+ (cycle complete)" }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      c2 c2 |
      aes,2 aes,2 |
      e,2 e,2 |
      c2 c2
    }
  >>
  \layout { }
}
