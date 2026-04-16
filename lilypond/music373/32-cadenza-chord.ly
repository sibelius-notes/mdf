\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 14\cm }
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key c \major \time 4/4
      \omit Score.BarNumber
      %% Cadenza approach: I6/4 cadenza chord, then V7 - I
      <c'' e'' g''>1^"I6/4 cadenza chord" |
      %% Soloist cadenza (fermata)
      \override NoteHead.color = #grey
      r1^"(cadenza)"
      \revert NoteHead.color |
      %% Resolution
      <b' d'' f'' g''>2^"V7" <c'' e'' g''>2^"ESC: I" \bar "|."
    }
    \new Staff {
      \clef bass \key c \major \time 4/4
      \omit Score.BarNumber
      g,1 | r1 | g,2 c,2 \bar "|."
    }
  >>
  \layout { }
}
