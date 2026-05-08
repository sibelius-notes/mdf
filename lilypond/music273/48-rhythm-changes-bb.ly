\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Rhythm Changes A section in Bb: bebop-style 8th-note melody + ChordNames + bass
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        % A section (8 bars)
        bes2:maj7 g2:7 c2:m7 f2:7
        f2:m7 bes2:7 ees2:maj7 aes2:7
        bes2:maj7 g2:7 c2:m7 f2:7
        bes2:maj7 g2:7 c2:m7 f2:7
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key bes \major \time 4/4
        \omit Score.BarNumber
        % Bebop-style 8th-note melody over A section
        % Bar 1: Bbmaj7
        d''8 c''8 bes'8 a'8 g'8 f'8 d'8 bes8 |
        % Bar 2: G7
        b8 cis'8 d'8 f'8 g'4 r4 |
        % Bar 3: Cm7
        ees'8 d'8 c'8 bes8 g'4 bes'8 c''8 |
        % Bar 4: F7
        ees''8 c''8 a'8 f'8 ees'4 r4 |
        % Bar 5: Fm7
        ees'8 f'8 ges'8 aes'8 bes'4 ges'8 ees'8 |
        % Bar 6: Bb7
        d'8 f'8 aes'8 c''8 d''4 aes'8 f'8 |
        % Bar 7: Ebmaj7
        g'4 bes'8 c''8 d''4 g'4 |
        % Bar 8: Ab7
        ges'8 bes'8 c''8 ees''8 ges''4 ees''8 c''8 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key bes \major \time 4/4
        \omit Score.BarNumber
        % Bass: roots on beats 1 and 3
        bes,2 g,2 |
        c2 f,2 |
        bes,2 g,2 |
        c2 f,2 |
        f,2 bes,2 |
        ees2 aes,2 |
        bes,2 g,2 |
        c2 f,2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
