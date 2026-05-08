\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Rameau's corps sonore (Traité, 1722): major triad emerging from harmonic series
% Bass = fundamental C; Treble = rising arpeggio of partials 2-6 in 3/4
% Partial 5 = E (5f), partial 6 = G (6f) — the major triad C-E-G appears in nature
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 3/4
      \omit Score.BarNumber
      % bar 1: partials 2-4
      c'4^\markup { \small "2f" }
      g'4^\markup { \small "3f" }
      c''4^\markup { \small "4f" } |
      % bar 2: partials 5-6, triad complete
      e''4^\markup { \small "5f" }
      g''4^\markup { \small "6f" }
      c''4^\markup { \small "C-E-G" } |
      % bar 3: sustained triad
      <c'' e'' g''>2.^\markup { \small "major triad from nature" } |
      % bar 4: cadential resolution
      <c' e' g'>2.^\markup { \small "corps sonore" }
    }
    \new Staff {
      \clef bass \key c \major \time 3/4
      \omit Score.BarNumber
      c2._\markup { \small "1f (fundamental)" }
      c2.
      c2.
      c2.
    }
  >>
  \layout { }
}
