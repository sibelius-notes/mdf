\version "2.24.0"
\paper { indent = 0 ragged-right = ##t line-width = 13\cm }
% Brahms intermezzo texture: cantabile + inner thirds + sustained bass
\score {
  \new GrandStaff <<
    \new Staff {
      \clef treble \key a \major \time 3/4 \omit Score.BarNumber
      \tempo "Andante teneramente"
      % Melody with inner voice thirds
      << { cis''4.\p ( b'8 a'4 ) } \\ { a'4. ( gis'8 fis'4 ) } >> |
      << { b'4 ( a'4 gis'4 ) } \\ { gis'4 ( fis'4 e'4 ) } >> |
      << { a'4. ( b'8 cis''4 ) } \\ { fis'4. ( gis'8 a'4 ) } >> |
      << { b'2. } \\ { gis'2. } >> |
    }
    \new Staff {
      \clef bass \key a \major \time 3/4 \omit Score.BarNumber
      % Sustained bass + middle voice
      << { e4\p <cis e>4 <cis e>4 } \\ { a,2. } >> |
      << { e4 <b, e>4 <b, e>4 } \\ { e,2. } >> |
      << { a,4 <a, cis>4 <a, cis>4 } \\ { a,,2. } >> |
      << { e4 <e b,>4 <e b,>4 } \\ { e,2. } >> |
    }
  >>
  \layout { }
}
