\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Opera buffa patter song style: rapid syllabic repeated notes
\score {
  \new Staff {
    \clef treble \key c \major \time 2/4 \omit Score.BarNumber
    \tempo \markup \italic "Opera buffa: parlando patter style"
    % Bar 1: rapid repeated note patter
    c'8\mf c'8 c'8 c'8 |
    % Bar 2: step up, then return
    d'8 d'8 d'8 d'8 |
    % Bar 3: fast syllabic pattern
    e'8 e'8 d'8 d'8 |
    % Bar 4: cadence
    c'4 r4 \bar "|."
  }
  \layout { }
}
