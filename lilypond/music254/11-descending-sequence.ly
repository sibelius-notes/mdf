\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Baroque descending-5ths circle sequence: D7–G–C7–F–Bb7–Eb over walking bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      \omit Score.BarNumber
      ^ \markup { \italic "Descending-5ths sequence" }
      <<
        { d''2^\markup{\small "D7"} b'4 g'4 | c''2^\markup{\small "G"} g'2 | c'2^\markup{\small "C7"} bes'4 e'4 | a'2^\markup{\small "F"} f'2 | }
        \\
        { fis'2 g'4 d'4 | e'2 d'2 | e'2 g'4 c'4 | c'2 a'2 | }
      >>
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      _ \markup { \italic "walking bass" }
      d4 c4 b,4 a,4 | g,4 f,4 e,4 d,4 | c,4 b,,4 a,,4 g,,4 | f,4 e,4 d,4 c,4 |
    }
  >>
  \layout { }
}
