\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Guido's hexachord system: Ut–Re–Mi–Fa–Sol–La on C (natural), F (soft/molle), G (hard/durum)
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble
      \key c \major
      \time 6/4
      \omit Score.BarNumber
      ^ \markup { \italic "Hexachorda naturale – molle – durum" }
      c'4^\markup{\tiny "ut"} d'^\markup{\tiny "re"} e'^\markup{\tiny "mi"} f'^\markup{\tiny "fa"} g'^\markup{\tiny "sol"} a'^\markup{\tiny "la"} |
      f'4^\markup{\tiny "ut"} g'^\markup{\tiny "re"} a'^\markup{\tiny "mi"} bes'^\markup{\tiny "fa"} c''^\markup{\tiny "sol"} d''^\markup{\tiny "la"} |
      g4^\markup{\tiny "ut"} a4^\markup{\tiny "re"} b4^\markup{\tiny "mi"} c'^\markup{\tiny "fa"} d'^\markup{\tiny "sol"} e'^\markup{\tiny "la"} |
    }
    \new Staff {
      \clef bass
      \key c \major
      \time 6/4
      _ \markup { \italic "mi–fa semitone (bracket)" }
      s2 s4 s4_\markup{\small "mi–fa"} s4 s4 |
      s2 s4 s4_\markup{\small "mi–fa"} s4 s4 |
      s2 s4 s4_\markup{\small "mi–fa"} s4 s4 |
    }
  >>
  \layout { }
}
