\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Lewin's GIS: int(s,t) = n, showing interval function
% Set {0,4,7} → T₅ → {5,9,0}: int(C,F)=5 consistently
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Source set {0,4,7}: C E G
        c'4^\markup { \tiny "x = {0,4,7}" }
        e'4 g'4
        |
        % Show interval function
        c'4^\markup { \small "int(x,y) = T₅" }
        r2
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c'' {
        \time 3/4
        % Target set T₅{0,4,7} = {5,9,0}: F A C
        f'4^\markup { \tiny "y = {5,9,0}" }
        a'4 c''4
        |
        f'4^\markup { \small "int(C,F) = 5 throughout" }
        r2
      }
    }
  >>
  \layout { }
}
