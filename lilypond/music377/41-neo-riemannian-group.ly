\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Hexatonic cycle (PLR): C maj → Cm → Ebmaj → Ebmin → Gbmaj → Gbmin → C maj
% GrandStaff: Treble = soprano voice leading, Bass = chord roots + full harmony
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 4/4
        % Soprano line showing smooth voice leading through P, R, L cycle
        % C maj: soprano = G
        g'2^\markup { \tiny "P↓" }
        % Cm: soprano = G (common tone under P)
        g'2^\markup { \tiny "R↓" }
        |
        % Eb maj: soprano = Bb (G→Bb under R in hexatonic logic)
        bes'2^\markup { \tiny "P↓" }
        bes'2^\markup { \tiny "L↓" }
        |
        % Gb maj: soprano = Db
        des''2^\markup { \tiny "P↓" }
        des''2^\markup { \tiny "→C" }
        |
        g'2 r2
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % Full chords in bass
        <c e g>2^\markup { \tiny "C" }
        <c ees g>2^\markup { \tiny "Cm" }
        |
        <ees g bes>2^\markup { \tiny "E♭" }
        <ees ges bes>2^\markup { \tiny "E♭m" }
        |
        <ges bes des'>2^\markup { \tiny "G♭" }
        <ges beses des'>2^\markup { \tiny "G♭m" }
        |
        <c e g>2^\markup { \tiny "C" }
        r2
      }
    }
  >>
  \layout { }
}
