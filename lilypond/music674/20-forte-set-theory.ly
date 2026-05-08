\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Forte set-class analysis of a short atonal fragment (Schoenberg Op.11 No.1 style)
% Each bracketed 3-note group is labeled with its Forte name below
% Interval vector of 3-11 shown in final bar
\score {
  \new Staff {
    \clef treble
    \omit Score.BarNumber
    \omit Score.TimeSignature
    \cadenzaOn
    % Group 1: {B, G#, G} = pc {11,8,7} → prime form {0,1,4} = 3-3
    b'8_\markup { \small "[3-3]" }
    gis'8 g'8 r8
    % Group 2: {G, Eb, C} = pc {7,3,0} → prime form {0,3,4} = 3-3
    g'8_\markup { \small "[3-3]" }
    ees'8 c'8 r8
    % Group 3: {C, B, G#} = {0,11,8} → prime form {0,1,4} = 3-3
    c''8_\markup { \small "[3-3]" }
    b'8 gis'8 r8
    % Group 4: {Eb, G, B} = {3,7,11} → prime form {0,4,8} = 3-12 (aug triad)
    ees'8_\markup { \small "[3-12]" }
    g'8 b'4
    \bar "|."
  }
  \layout { }
}
\markup {
  \small "3-3: ic vector [101100]  |  3-12 (aug. triad): ic vector [000300]"
}
