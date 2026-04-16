\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
% Solmization mutation across hexachords on C (naturale), G (durum), F (molle)
\score {
  \new Staff {
    \clef treble \key c \major \time 4/4
    \omit Score.BarNumber
    % Hexachordum naturale ut=C
    c'4^\markup { \small "C: ut" }
    d'4^\markup { \small "re" }
    e'4^\markup { \small "mi" }
    f'4^\markup { \small "fa" }
    % mutation at G: sol in naturale = ut in durum
    g'4^\markup { \small "sol→ut" }
    a'4^\markup { \small "re" }
    b'4^\markup { \small "mi" }
    c''4^\markup { \small "fa (G-hex)" }
    % hexachordum molle ut=F
    f'4^\markup { \small "F: ut" }
    g'4^\markup { \small "re" }
    a'4^\markup { \small "mi" }
    bes'4^\markup { \small "fa♭" }
  }
  \layout { }
}
