# AppBuilder-workaround
Workarounds for SAB, DAB, RAB

## 1 App Builders Java version support <a id="h2-1"></a>

### For running the SAB, RAB application

* Windows
  * Version 4.5 and below Java 8
  * Version 4.6 and above Java 8, 9 and 10
* Linux versions up to 4.6.1 Java 8
* Mac versions up to 4.6.1 Java 8

### For building Android apps

* Java JDK 8

## 2 SAB 3.5 bug in keystore creation <a id="h2-2"></a>

This workaround lets you create a keystore at the commandline. Use create-keystore.cmd

This file will detect the path of Java 1.8 JDK and use that to create the keystore. 
1. Download the Release. https://github.com/SILAsiaPub/AppBuilder-workaround/releases/tag/1
2. Unzip it. 
3. Put the file create-keystore.cmd into the folder "C:\users\%username&\Documents\App Builder\keystore". 
4. Double click the file in Windows Explorer.
5. Follow the prompts for filling in the rest of the information.
6. Now in your app builder choose this new keystore to create your app. Under App > App Signing \[tab\]

## 3 SAB 3.5 missing books in some OT books. <a id="h2-3"></a>

The following books of the OT have some ommissions:

* Malachai 4
* Isiaih 66

This is fixed since version: ???

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

## 4 App icon on desktop when clicked does not start SAB <a id="h2-4"></a>

This is not an SAB issue but rather a computer issue where .jar files are associated with nothing or another program.

### Here are some solutions

* Instead of the shortcut pointing to the .jar file, change the link so it points to the sab.bat file.
* You can force your registry to point to your java installation. See the jar-fix-reg.cmd. You must run this command prompt as Administrator. This process creates a backup file of your registration entry so it is easy to Merge the old entry back if something else breaks. It asks two questions about merging. Answer Yes to each one.
* There are various FixJava programs available on the internet.

## 5 Issue with *object heap* <a id="h2-5"></a>

32 bit OS or 64 bit OS running 32 bit Java seem to have an issue with the **object heap** size. 

To fix this do the following:
1. Create this file: C:\\Users\\yourname\\.gradle\\gradle.properties
2. Add the following line:<br />
  org.gradle.jvmargs=-XX\:MaxHeapSize\=256m -Xmx256m
3. Close SAB, reopen and try and build again.
