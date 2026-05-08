\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Secondary dominant cycle in C: A7-Dm7 | D7-G7 | C7-Fmaj7, each V7 tonicizes next
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        a2:7 d2:m7 d2:7 g2:7 c2:7 f2:maj7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \major \time 4/4
        \omit Score.BarNumber
        % Quarter-note melody connecting secondary dominants
        cis'4 d'4 fis'4 g'4 |
        bes'4 c''4 e'4 f'4 |
        % Short rest
        r1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \major \time 4/4
        \omit Score.BarNumber
        a,2_\markup { \tiny "V/ii" } d2_\markup { \tiny "ii" } |
        d,2_\markup { \tiny "V/V" } g,2_\markup { \tiny "V" } |
        c2_\markup { \tiny "V/IV" } f,2_\markup { \tiny "IV" } |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
