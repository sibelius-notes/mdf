\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Bar 1: A4 = 440 Hz
    a'1\mf^\markup { \tiny "A4 = 440 Hz (concert pitch)" } |
    % Bar 2: same pitch, reinforced
    a'1^\markup { \tiny "absolute pitch listener: 'A'" } |
    % Bar 3: slightly detuned Bbb4 (enharmonic Ab4 used as close proxy)
    beses'1^\markup { \tiny "Bbb4 ≈ 440 Hz — A or Bb?" } |
    % Bar 4: resolution back to clear A
    a'1_\markup { \tiny "A4 — confirmed" } |
  }
  \layout { }
}
