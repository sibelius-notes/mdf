\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Section 4.4 — Coupling (Koppelung): two registers linked as a structural pair
% 3̂ at E5 and E4 alternate as coupled registers
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    % High register 3̂
    e''2^"3̂ high"
    % Transfer down to lower register
    (e'2)^"3̂ low"
    % Back up — coupling exchange
    (e''2)^"coupled"
    (e'2)
  }
  \layout { }
}
