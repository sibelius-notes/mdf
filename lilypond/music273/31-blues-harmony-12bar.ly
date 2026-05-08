\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% 12-bar jazz blues in Bb: bebop head melody (A section) + walking bass + ChordNames
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        bes1:7 bes1:7 bes1:7 bes1:7
        ees1:7 ees1:7
        bes1:7 g1:7
        c1:m7 f1:7
        bes1:7 f1:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key bes \major \time 4/4
        \omit Score.BarNumber
        % Original bebop-style melody over 12-bar Bb blues
        % Bars 1-4: I7 (Bb7) — melodic statement
        d''4 c''8 bes'8 aes'4 f'4 |
        bes'8 aes'8 f'8 d'8 bes4 r4 |
        d''4. c''8 bes'4 aes'4 |
        f'8 g'8 aes'4 bes'2 |
        % Bars 5-6: IV7 (Eb7)
        g'4 ges'8 f'8 ees'4 ees'4 |
        f'8 ees'8 des'8 c'8 bes4 r4 |
        % Bars 7-8: I7 (Bb7) / V7/vi (G7)
        d''4 c''8 bes'8 aes'4 f'4 |
        b'4 d''4 f''4 a''4 |
        % Bars 9-10: ii-V (Cm7/F7)
        ees''4 c''8 bes'8 g'4 ees'4 |
        f'4 aes'4 c''2 |
        % Bars 11-12: I7 (Bb7) / turnaround (F7)
        bes'4 aes'8 g'8 f'4 ees'4 |
        d'8 ees'8 f'4 r2 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key bes \major \time 4/4
        \omit Score.BarNumber
        % Walking bass line (quarter notes)
        bes,4 d4 f4 aes4 |
        bes,4 f,4 d4 aes,4 |
        bes,4 d4 f4 aes4 |
        bes,4 g,4 aes,4 bes,4 |
        ees4 bes,4 ges4 ees4 |
        ees4 bes,4 g,4 bes,4 |
        bes,4 d4 f4 aes4 |
        g,4 b,4 d4 f4 |
        c4 ees4 g4 bes4 |
        f,4 a,4 c4 ees4 |
        bes,4 d4 f4 g4 |
        f,4 a,4 c4 f,4 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
