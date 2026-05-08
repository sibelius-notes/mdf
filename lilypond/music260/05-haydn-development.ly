\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Haydn developmental procedure: fragmentation and sequence
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4 \omit Score.BarNumber
      % Bar 1: full 4-note motive
      c'4^\markup { "Motive" } d'4 e'4 f'4 |
      % Bar 2: motive fragmented to 2 notes
      c'4^\markup { "Fragment" } d'4 c'4 d'4 |
      % Bar 3: sequence one step lower (Bb-C)
      bes4^\markup { "Seq. ↓" } c'4 bes4 c'4 |
      % Bar 4: sequence lower (Ab-Bb), arriving on dominant
      aes4^\markup { "→ V" } bes4 g2 |
    }
    \new Staff {
      \clef bass \key c \major \time 4/4 \omit Score.BarNumber
      c2 f2 |
      g2 g2 |
      ees2 ees2 |
      c2 g,2 |
    }
  >>
  \layout { }
}
