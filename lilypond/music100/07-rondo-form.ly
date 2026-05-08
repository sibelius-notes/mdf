\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Rondo form (A–B–A–C–A): recurring refrain with contrasting episodes
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4 \omit Score.BarNumber
    \mark \markup { \box "A" }
    c'4 e'4 g'4 c''4 |
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
    \mark \markup { \box "B" }
    \key f \major
    f'4 g'4 a'4 f'4 |
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
    \mark \markup { \box "A" }
    \key c \major
    c'4 e'4 g'4 c''4 |
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
    \mark \markup { \box "C" }
    \key g \major
    g'4 a'4 b'4 g'4 |
    \once \override Score.RehearsalMark.break-visibility = #end-of-line-invisible
    \mark \markup { \box "A" }
    \key c \major
    c'4 e'4 g'4 c''4 |
  }
  \layout { }
}
