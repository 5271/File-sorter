import osproc;
import strutils
import utilib;

stdout.write "Are you sure you want to put all these files in the archive? [Y/N] ";
var inp = readLine stdin;
if inp == "Y":
 var allFiles = split((execCmdEx "ls")[0], "\n");
 var directories = split(((execCmdEx "ls -d */")[0]).replace("/", ""), "\n");
 
 for file in allFiles:
  if directories.find(file) != -1:
      #echo "directory found - " & file;
      continue;
  
  #echo "file found - " & file;
  
  var fileExtension = split(file, ".")[split(file, ".").len()-1];

  case fileExtension
   of "png", "jpeg", "jpg", "jfjf", "gif", "bmp", "tga", "dds":
    discard execCmd("mv \"" & file.unixifyText() & "\" ~/Archive/Pictures");
   of "mp4", "mov", "awi", "webm", "swf", "mkv":
    discard execCmd("mv \"" & file.unixifyText() & "\" ~/Archive/Videos");
   of "mp3", "ogg", "m4a", "wav":
    discard execCmd("mv \"" & file.unixifyText() & "\" ~/Archive/Audio\\ Files");
   of "rar", "7z", "tar", "apk", "bz2", "cbz", "jar", "epub", "gz", "lrz", "xz":
    discard execCmd("mv \"" & file.unixifyText() & "\" ~/Archive/Archives");
   else:
    discard execCmd("mv \"" & file.unixifyText() & "\" ~/Archive/Misc");

 echo "Files sorted successfully :3";