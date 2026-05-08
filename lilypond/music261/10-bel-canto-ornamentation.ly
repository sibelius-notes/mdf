\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Bel canto ornamentation guide: plain melody then ornamented version
\score {
  \new Staff {
    \clef treble \key g \major \time 4/4 \omit Score.BarNumber
    % Bars 1-2: plain melody
    \mark \markup { \bold "Plain" }
    g'4\mf a'4 b'4 c''4 |
    d''2 g'2 \bar "||"
    % Bars 3-4: ornamented version
    \mark \markup { \bold "Ornamented" }
    \grace { fis'16 } g'4 \trill a'8 ( \grace { b'16 } a'8 ) b'8 ( a'8 g'8 ) c''8 |
    d''4 \turn c''8 ( b'8 ) \appoggiatura { c''8 } d''4 g'4 \bar "|."
  }
  \header {
    piece = \markup \italic "Bel canto ornaments: trill, turn, appoggiatura"
  }
  \layout { }
}
