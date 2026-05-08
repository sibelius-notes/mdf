\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Guido's Hexachordum Naturale on C: ut-re-mi-fa-sol-la
% Upper voice: rising melody in quarter notes with solmization lyrics
% Bass: sustained C pedal per bar; mi-fa semitone highlighted
\score {
  <<
    \new Staff {
      \clef treble \key c \major \time 3/4
      \omit Score.BarNumber
      c'4 d'4 e'4 |
      f'4^\markup { \tiny "← mi-fa (semitone)" } g'4 a'4 \bar "|."
    }
    \addlyrics {
      ut re mi
      fa sol la
    }
    \new Staff {
      \clef bass \key c \major \time 3/4
      \omit Score.BarNumber
      c2._\markup { \small "C hexachord (naturale)" }
      c2.
    }
  >>
  \layout { }
}
