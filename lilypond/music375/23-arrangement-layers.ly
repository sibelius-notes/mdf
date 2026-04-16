\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new StaffGroup <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Melody (top line)
      \relative c'' {
        g4 a b c | c4 b a g2 |
      }
    }
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      % Harmony (block chords)
      \relative c' {
        <c e g>1 | <c e g>1 |
      }
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      % Bass (root notes)
      \relative c {
        c1 | c1 |
      }
    }
  >>
  \layout { }
}
