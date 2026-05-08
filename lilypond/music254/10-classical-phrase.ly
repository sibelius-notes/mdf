\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Classical sentence: BI, continuation, cadential"
}

\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 4/4
      ^ \markup { \italic "melody" }
      % Bars 1-2: basic idea (BI)
      c'4^\markup { \small "BI" } e'4 g'4 e'4 |
      c'4 e'4 g'2 |
      % Bar 3: continuation (fragmentation)
      g'8^\markup { \small "cont." } f'8 e'8 d'8 c'8 d'8 e'8 f'8 |
      % Bar 4: cadential V7-I
      g'4^\markup { \small "cad." } f'4 e'4 d'4 |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 4/4
      c4 e4 g4 e4 |
      c4 e4 g2 |
      c'4 b4 a4 g4 |
      < g, g>4 < f, f>4 < g, g>4 < c, c>4 |
    }
  >>
  \layout { }
}
