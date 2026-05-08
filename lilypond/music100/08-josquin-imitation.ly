\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Renaissance imitative counterpoint (Josquin-style)
% Subject entry in treble (bar 1), imitated in bass 2 bars later
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \time 4/4 \omit Score.BarNumber
      \once \override Score.RehearsalMark.self-alignment-X = #LEFT
      \mark \markup { \small \italic "Subject (upper voice)" }
      g'4^\markup { \tiny "subject" } a'4 b'4 c''4 |
      d''2 g'2 |
      r4 a'4 b'4 c''4 |
      d''2 g'1 |
    }
    \new Staff {
      \clef bass \time 4/4 \omit Score.BarNumber
      r1 |
      r1 |
      c4^\markup { \tiny "imitation" } d4 e4 f4 |
      g2 c2 |
    }
  >>
  \layout { }
}
