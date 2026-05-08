\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Meantone temperament: C major scale with deviation labels, then the wolf fifth
% Bars 1-4: meantone scale in half notes (C-D-E-F-G-A-B-C) with cent deviations from ET
% Bars 5-6: wolf fifth G#-Eb dyad labeled
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 2/2
      \omit Score.BarNumber
      c'2^\markup { \small "C 0¢" } d'2^\markup { \small "D −6.8¢" } |
      e'2^\markup { \small "E −13.7¢" } f'2^\markup { \small "F +3.4¢" } |
      g'2^\markup { \small "G −3.4¢" } a'2^\markup { \small "A −10.3¢" } |
      b'2^\markup { \small "B −17.1¢" } c''2^\markup { \small "C 0¢" } |
      % Wolf fifth: Eb-G# (diminished sixth in meantone)
      gis'1^\markup { \small "G♯ (wolf upper, ≈ 737¢ from E♭)" } |
      gis'1^\markup { \small "≈ 737¢ (should be 702¢)" }
    }
    \new Staff {
      \clef bass \key c \major \time 2/2
      \omit Score.BarNumber
      c2 d,2 |
      e,2 f,2 |
      g,2 a,2 |
      b,2 c2 |
      ees2_\markup { \small "Wolf 5th: E♭–G♯" } ees2 |
      ees1_\markup { \small "meantone temperament (c. 1500–1700)" }
    }
  >>
  \layout { }
}
