\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Harry Partch's 43-tone just intonation scale (Genesis of a Music, 1949)
% Selected pitches including 7th, 11th, 13th partials unavailable in ET
% Each pitch labeled with ratio and approximate deviation from ET
\score {
  \new Staff {
    \clef treble
    \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    % Standard JI pitches
    c'4^\markup { \small "1/1 = 0¢" }
    d'4^\markup { \small "9/8 = +4¢" }
    e'4^\markup { \small "5/4 = −14¢" }
    % Partch-specific 7-limit pitches
    bes'4^\markup { \small "7/4 = −31¢" }
    % 11-limit: 11/8 ≈ F# quarter-tone flat
    fis'4^\markup { \small "11/8 = −49¢" }
    % 13-limit: 13/8 ≈ Ab high
    aes'4^\markup { \small "13/8 = +41¢" }
    \bar "|."
    c''1^\markup { \small "2/1 = 0¢" }
    \bar "|."
  }
  \layout { }
}
\markup {
  \small "Partch's 43-tone scale extends JI to 11- and 13-limit harmonics"
}
