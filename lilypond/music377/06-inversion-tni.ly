\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% T₀I applied to Op.11 {7,8,11}: I₀{7}=5(F), I₀{8}=4(E), I₀{11}=1(Db)
% Original G-G#-B vs TnI version F-E-Db
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 2/4
        % Original: G G# B  {7,8,11}
        g'4^\markup { \tiny "G (7)" }
        gis'4^\markup { \tiny "G♯ (8)" }
        |
        b'2^\markup { \tiny "B (11)  {7,8,11}" }
        |
        r2
        |
        r2
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 2/4
        r2
        |
        r2
        |
        % T₀I inversion: F-E-Db  {5,4,1}
        f'4^\markup { \tiny "F (5)" }
        e'4^\markup { \tiny "E (4)" }
        |
        des'2^\markup { \tiny "D♭ (1)  T₀I{7,8,11}" }
      }
    }
  >>
  \layout { }
}
