\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Ternary form (A–B–A'): three contrasting sections
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    \mark \markup { \box "A" }
    c'4 e'4 g'4 e'4 |
    g'2 c'2 |
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
    \mark \markup { \box "B" }
    \key a \minor
    a4 c'4 e'4 c'4 |
    e'2 a2 |
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
    \mark \markup { \box "A'" }
    \key c \major
    c'4 e'4 g'4 e'4 |
    c'1 |
  }
  \layout { }
}
