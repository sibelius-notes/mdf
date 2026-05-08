\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }

\markup {
  \bold "Sonata form schema"
}

\score {
  \new Staff {
    \clef treble
    \key c \major
    \time 4/4
    % P-theme in C major (I)
    c'4^\markup { \small "P (I)" } e'4 g'4 e'4 |
    g'4 a'4 g'2 |
    % Transition (TR) moving to V
    g'4^\markup { \small "TR" } a'4 b'4 c''4 |
    % Medial Caesura: fermata on rest
    r1^\markup { \small "MC" \fermata } |
    % S-theme in G major (V)
    d''4^\markup { \small "S (V)" } b'4 g'4 b'4 |
    a'4 g'4 f'4 e'4 |
    % C-theme closing, cadence in G
    d'4^\markup { \small "C" } e'4 f'4 g'4 |
    % EEC double bar
    g'1^\markup { \small "EEC" } \bar "||"
  }
  \layout { }
}
