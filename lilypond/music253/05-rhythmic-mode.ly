\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "The six rhythmic modes"
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 3/4
    % Mode I: long-short (dotted quarter + eighth)
    c'4.^\markup { \small "I" } c'8 r4 |
    % Mode II: short-long (eighth + dotted quarter)
    c'8^\markup { \small "II" } c'4. r4 |
    % Mode III: long-short-short
    c'4.^\markup { \small "III" } c'8 c'4 |
    % Mode IV: short-short-long
    c'8^\markup { \small "IV" } c'8 c'4. r8 |
    % Mode V: all longs
    c'2.^\markup { \small "V" } |
    % Mode VI: all breves (equal eighths)
    c'8^\markup { \small "VI" } c'8 c'8 c'8 c'8 c'8 |
  }
  \layout { }
}
