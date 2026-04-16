\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 16\cm }
\score {
  {
    \clef treble \key c \major \time 8/4
    \omit Score.BarNumber
    \override Score.RehearsalMark.self-alignment-X = #LEFT
    \mark \markup { \small "Dorian" }
    d'4 e' f' g' a' b' c'' d''
    \mark \markup { \small "Phrygian" }
    e'4 f' g' a' b' c'' d'' e''
    \mark \markup { \small "Lydian" }
    f'4 g' a' b' c'' d'' e'' f''
    \mark \markup { \small "Mixolydian" }
    g'4 a' b' c'' d'' e'' f'' g''
    \mark \markup { \small "Aeolian" }
    a'4 b' c'' d'' e'' f'' g'' a''
    \mark \markup { \small "Ionian" }
    c'4 d' e' f' g' a' b' c''
  }
  \layout { }
}
