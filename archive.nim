import osproc;
import strutils
import utilib;
import std/os;

stdout.write "Are you sure you want to put all these files in the archive? [Y/N] ";
var inp = readLine stdin;
if inp == "Y":
    if not dirExists("~/Archive"):
        discard execCmd("mkdir ~/Archive")
        discard execCmd("mkdir ~/Archive/Archives")
        discard execCmd("mkdir ~/Archive/Audio\\ Files")
        discard execCmd("mkdir ~/Archive/Misc")
        discard execCmd("mkdir ~/Archive/Pictures")
        discard execCmd("mkdir ~/Archive/Videos")
    else:
        if not dirExists("~/Archive/Archives"): 
            discard execCmd("mkdir ~/Archive/Archives");
        if not dirExists("~/Archive/Audio\\ Files"): 
            discard execCmd("mkdir ~/Archive/Audio\\ Files");
        if not dirExists("~/Archive/Misc"): 
            discard execCmd("mkdir ~/Archive/Misc");
        if not dirExists("~/Archive/Pictuers"): 
            discard execCmd("mkdir ~/Archive/Pictures");
        if not dirExists("~/Archive/Videos"): 
            discard execCmd("mkdir ~/Archive/Videos");

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

    echo "Files sorted successfully";