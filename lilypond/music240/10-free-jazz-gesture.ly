\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Post-bop/free jazz gesture: no key, no meter, clusters, leaps
\score {
  \new Staff {
    \omit Staff.TimeSignature
    \omit Score.BarNumber
    \clef treble
    \once \override Score.RehearsalMark.self-alignment-X = #LEFT
    \mark \markup { \small \italic "Free jazz: no chord changes, no meter" }
    <c' e' g' b'>2\ff
    \repeat tremolo 4 { c''32 ees''32 }
    |
    d''4-> r8 aes''8\p~ aes''4 fis'4-> |
    <ees' g' b' d''>4\ff r4
    \repeat tremolo 4 { f'32 a'32 }
    c'''4\p |
    bes'4-> g''4-> r2 |
  }
  \layout { }
}
