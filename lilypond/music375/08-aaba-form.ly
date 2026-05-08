\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

% AABA 32-bar form (shown condensed: 2 bars each section = 8 bars total)
% Box labels mark formal sections; repeat volta for A sections

\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    \relative c'' {
      % A section
      \mark \markup { \box "A" }
      \repeat volta 2 {
        c4 e g e | f4 e d2 |
      }
      % B section (bridge / release)
      \mark \markup { \box "B" }
      a'4 g f e | d4 e f2 |
      % Final A section
      \mark \markup { \box "A" }
      c4 e g e | f4 e c2 \bar "|."
    }
  }
  \layout { }
}
