# AppBuilder-workaround
Workarounds for SAB, DAB, RAB

## 1 App Builders do not support Java 9.

Uninstall Java 9 and get the latest version of Java 8.

## 2 SAB 3.5 bug in keystore creation

This workaround lets you create a keystore at the commandline. Use create-keystore.cmd

This file will detect the path of Java 1.8 JDK and use that to create the keystore.

## 3 SAB 3.5 missing books in some OT books.

The following books of the OT have some ommissions:

* Malachai 4
* Isiaih 66

### To fix this before the next version:


1. Close SAB.
1. Open the .appdef file in an XML editor.
1. Copy the last books/book/audio section for Mal and paste after the last audio chapter. It looks like this Malachi example:
  ```
  <audio chapter="4">
    <filename src="d1" len="">C:\pathtoaudio\MAL-4.mp3</filename>
    <timing-filename>C:\Users\%username%\Documents\App Builder\Scripture Apps\Timings\org.name.iso.scr\39-MAL-4-timing.txt</timing-filename>
  </audio>
  ```
1. You just need to change the audio path, book and chapter numbers on three lines.

## 4 App icon on desktop when clicked does not start SAB

This is not an SAB issue but rather a computer issue where .jar files are associated with nothing or another program.

### Here are some solutions

* Instead of the shortcut pointing to the .jar file, change the link so it points to the sab.bat file.
* You can force your registry to point to your java insallations. See the jar-fix-reg.cmd. This process creates a backup file of your registration entry so it is eacy to Merge the old entry back if somthing else breaks.
* There are various FixJava programs available on the internet.