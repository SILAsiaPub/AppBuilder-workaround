# RAB SFM cheat sheet

## Headings
- `\id` Not displayed. Information about what is in the file. Metadata
- `\h` or `\toc2` The wording that appears in the book list selection menu
- `\toc3` The abbreviation that appears in the Book grid selection menu

## Pages and Chapters
- `\c` or `\page` Use to separate material into different chapters or pages


## Paragraphs
- `\s1` section header or for songs a song title
- `\b` a blank line
- `\p` a paragraph with indented first line
- `\pi` an indented paragraph with indented first line
- `\pc` paragraph centered
- `\pmr` paragraph right aligned, Used for chords in song books
- `\m` a paragraph no first line indent
- `\mi` an indented paragraph no first line indent
- `\q1` used in songs for song verse, indented with first line hanging indent
- `\q2` used in songs for song chorus, more indented with first line hanging indent
- `\rem` Not displayed. Comment line for your use

## Media
- `\video` videoID (Video defined in Video section and video ID used now v5.0+)
- `\img` file name of image to go at top of page
- `\fig filename.jpg\fig*` used for inline picture insertion
- `\fig |filename.jpg||||Caption here|\fig*` used for inline picture with caption.
  - `\fig DESC|FILE|SIZE|LOC|COPY|CAP|REF\fig*` Full specification from USFM reference.
- `[Hyperlink text](linklocation)` used for internal or external hyperlinks. Borrowed from Markdown.
  - `[this page](https://github.com/SILAsiaPub/AppBuilder-workaround/edit/master/RAB-cheat-sheet.md)`
  - `[go to Book Id B001 chapter 2 in app](B001.2)`
  - SAB cross collection links `[go to collection C03 and book MAT Chaper 1](C03/MAT.1)`

## Character markup
- `\v` used to number the verses in a song, the number is out side of the indent.
  `\q1 \v 1 First line of verse one`
- `\bd bolded words\bd*` bold words
- `\it italicised words\it*` italicised words
