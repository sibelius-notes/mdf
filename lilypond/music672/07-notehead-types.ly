\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Section 3.2 — Notehead types in context: Vordergrund vs. Hintergrund
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1–2: Vordergrund — filled noteheads, active 8th-note motion
      c''8^\markup { "Vordergrund" } d'' e'' f'' g'' f'' e'' d'' |
      c''8 e'' g'' e'' c''4 g'8 a' |
      % Bar 3–4: Hintergrund — open noteheads, structural tones only
      e''1^\markup { "Hintergrund" } |
      c''1 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1–2: Vordergrund bass — filled noteheads
      c8 e g e c4 g,8 a, |
      c8 g, e, g, c,4 c,4 |
      % Bar 3–4: Hintergrund bass — open noteheads
      c1 |
      c,1 |
    }
  >>
  \layout { }
}
