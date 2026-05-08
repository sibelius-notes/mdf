\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Da capo aria form (ABA'): A in G major, B in E minor, D.C. al Fine
\score {
  \new Staff {
    \clef treble \key g \major \time 4/4 \omit Score.BarNumber
    % A section: 2 bars in G major
    \mark \markup { \bold "A" }
    g'4\mf a'4 b'4 c''4 |
    d''2 g'2 \bar "||"
    % B section: 2 bars in E minor (contrasting)
    \mark \markup { \bold "B" }
    \key e \minor
    e'4\mp fis'4 g'4 a'4 |
    b'2 e'2 \bar "||"
    % Empty bar for D.C. indication
    \key g \major
    \mark \markup { \bold "D.C. al Fine" }
    g'1^\markup \italic "(A' with ornamentation)" \bar "||"
  }
  \layout { }
}
