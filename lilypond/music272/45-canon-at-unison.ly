\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 15\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key g \major \time 4/4
      \omit Score.BarNumber
      g'4^\markup { \small "dux" } a' b' c'' | d''4 c'' b' a' | g'1
      \bar "|."
    }
    \new Staff {
      \clef treble \key g \major \time 4/4
      r1 | g'4^\markup { \small "comes (1 bar later)" } a' b' c'' | d''4 c'' b' a'
      \bar "|."
    }
  >>
  \layout { }
}
