\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Autumn Leaves A section: original vs reharmonization (2 systems, 7 bars each)
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        % System 1: original changes
        c1:m7 f1:7 bes1:maj7 ees1:maj7
        a1:m7.5- d1:7 g1:m
        % System 2: reharmonization
        c1:m7 b1:7 bes1:maj7 a1:7
        aes1:maj7 des1:7 g1:m
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key bes \major \time 4/4
        \omit Score.BarNumber
        % Melody preserved (same both systems): D-Eb-F-G rising
        ees'4^\markup { \tiny "original" } f'4 g'2 |
        a'4 bes'4 c''2 |
        d''2. bes'4 |
        g'2 ees'2 |
        a'4 c''4 ees''4 g'4 |
        fis'4 a'4 c''2 |
        g'1 |
        % Reharmonization: same melody notes, different chord colors
        ees'4^\markup { \tiny "reharmonized" } f'4 g'2 |
        a'4 bes'4 c''2 |
        d''2. bes'4 |
        g'2 ees'2 |
        a'4 c''4 ees''4 g'4 |
        fis'4 a'4 aes'4 f'4 |
        g'1 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key bes \major \time 4/4
        \omit Score.BarNumber
        % Original bass
        c2 ees2 |
        f,2 c2 |
        bes,2 f,2 |
        ees2 bes,2 |
        a,2 ees2 |
        d2 a,2 |
        g,1 |
        % Reharmonized bass: tritone subs create chromatic descents
        c2 ees2 |
        b,2 f,2 |
        bes,2 e,2 |
        a,2 ees2 |
        aes,2 ees2 |
        des2 aes,2 |
        g,1 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
