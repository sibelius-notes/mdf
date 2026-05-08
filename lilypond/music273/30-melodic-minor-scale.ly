\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% C melodic minor (jazz minor) lick over Cm(maj7): hybrid minor-major quality
\score {
  <<
    \new ChordNames {
      \chordmode {
        \set chordChanges = ##t
        c2:m7+ c2:m7+ c1:m7+
      }
    }
    \new GrandStaff <<
      \new Staff {
        \clef treble \key c \minor \time 4/4
        \omit Score.BarNumber
        % Bar 1: ascending jazz minor run, feature A natural and B natural
        c'8 d'8 ees'8 f'8 g'8 a'8 b'8 c''8 |
        % Bar 2: descend through B natural back to G, land on C
        b'8 a'8 g'8 f'8 ees'8 d'8 c'4 |
        \bar "|."
      }
      \new Staff {
        \clef bass \key c \minor \time 4/4
        \omit Score.BarNumber
        c2 g,2 |
        c2 ees2 |
        \bar "|."
      }
    >>
  >>
  \layout { }
}
