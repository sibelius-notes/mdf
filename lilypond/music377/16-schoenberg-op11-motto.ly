\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Schoenberg Op.11 No.1 opening: B-G#-G motto {11,8,7} = [3-3] (014)
% Treble = dotted-8th/16th melodic figure; Bass = sparse textural response
\score {
  \new GrandStaff <<
    \new Staff \with { \omit KeySignature } {
      \clef treble
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c''' {
        \time 4/4
        % Bar 1: the iconic B-G#-G descent with Schoenberg's rhythm
        b'4.^\markup { \tiny "B (11)" }
        gis'8~
        gis'4
        g'4^\markup { \tiny "G (7)  {7,8,11}=[3-3]" }
        |
        % Bar 2: development — [3-3] set class in new transposition
        r4
        ees'8^\markup { \tiny "E♭ (3)" }
        e'8^\markup { \tiny "E (4)" }
        aes'4^\markup { \tiny "A♭ (8)  T₄(014)" }
        |
        % Bar 3: [3-3] in yet another transposition
        r4
        a'8^\markup { \tiny "A (9)" }
        bes'8^\markup { \tiny "B♭ (10)" }
        des''4^\markup { \tiny "D♭ (1)  T₉(014)" }
        |
        % Bar 4: return — B motif answered
        b'2.^\markup { \tiny "B (11) return" }
        r4
        \pp
      }
    }
    \new Staff \with { \omit KeySignature } {
      \clef bass
      \omit Score.BarNumber
      \override Staff.TimeSignature.stencil = ##f
      \relative c {
        \time 4/4
        % Bass: sparse single notes responding to treble
        r2
        g,4\pp r4
        |
        r1
        |
        fis,4 r4 r2
        |
        r1
      }
    }
  >>
  \layout { }
}
