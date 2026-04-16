\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 8.5 — Schachter's tonal rhythm: slow structural rhythm vs. fast surface
% Background: two whole notes; Foreground: rapid sixteenth-note surface
\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = \markup \tiny "BG" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Slow structural rhythm: one harmony per whole note
      e''1^"I region" d''1^"V region"
    }
    \new Staff \with { instrumentName = \markup \tiny "FG" } {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Fast foreground: many notes over same structural span
      e''16 f'' g'' f'' e'' d'' c'' e'' g'' a'' g'' f'' e'' d'' e'' f''
      d''16 e'' f'' e'' d'' c'' b' c'' d'' e'' f'' g'' a'' b' c'' d''
    }
  >>
  \layout { indent = 1.2\cm }
}
