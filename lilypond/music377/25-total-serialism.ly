\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Total serialism: Boulez Structures Ia — pitch, duration, dynamic all serialized
% Pitch series: Eb D A Ab G F# E C# C Bb F B  (pcs: 3 2 9 8 7 6 4 1 0 10 5 11)
% Duration series: 1-12 in 32nds; Dynamic series: pp p mp mf f ff...
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 12/4
        % Pitch + Duration + Dynamic serialized
        ees'32\pp^\markup { \tiny "d=1 pp" }
        d'16\p^\markup { \tiny "d=2 p" }
        a'16.\mp^\markup { \tiny "d=3 mp" }
        aes'8\mf^\markup { \tiny "d=4 mf" }
        g'8.\f^\markup { \tiny "d=5 f" }
        fis'4\ff^\markup { \tiny "d=6 ff" }
        e'4.\mf^\markup { \tiny "d=7" }
        des'2\mp^\markup { \tiny "d=8" }
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 12/4
        % Rhythmic duration series label staff
        r32^\markup { \tiny "pitch ×" }
        r16^\markup { \tiny "dur ×" }
        r16.^\markup { \tiny "dyn ×" }
        r8 r8. r4 r4. r2
        r1^\markup { \small "all parameters from row" }
      }
    }
  >>
  \layout { }
}
