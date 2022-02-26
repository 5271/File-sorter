import osproc;
import strutils
import utilib;
import std/os;

var args = commandLineParams();

var exec = false;
var forceFlag = false;
var cleanFlag = false;

if args.find("-f") != -1 or args.find("--force") != -1:
    forceFlag = true;
if args.find("-l") != -1 or args.find("--clean") != -1:
    cleanFlag = true;

if forceFlag or cleanFlag:
    exec = true;
else:
    stdout.write "Are you sure you want to put all these files in the archive? [Y/N] ";
    var inp = readLine stdin;
    if inp == "Y" or inp == "y" or inp == "yes" or inp=="Yes":
        exec = true;

if exec:
    if not directoryExists("~/Archive"):
        discard execCmd("mkdir ~/Archive")
        discard execCmd("mkdir ~/Archive/Archives")
        discard execCmd("mkdir ~/Archive/Audio\\ Files")
        discard execCmd("mkdir ~/Archive/Misc")
        discard execCmd("mkdir ~/Archive/Pictures")
        discard execCmd("mkdir ~/Archive/Videos")
    else:
        if not directoryExists("~/Archive/Archives"): 
            discard execCmd("mkdir ~/Archive/Archives");
        if not directoryExists("~/Archive/Audio\\ Files"): 
            discard execCmd("mkdir ~/Archive/Audio\\ Files");
        if not directoryExists("~/Archive/Misc"): 
            discard execCmd("mkdir ~/Archive/Misc");
        if not directoryExists("~/Archive/Pictures"): 
            discard execCmd("mkdir ~/Archive/Pictures");
        if not directoryExists("~/Archive/Videos"): 
            discard execCmd("mkdir ~/Archive/Videos");

    let allFiles = split((execCmdEx "ls")[0], "\n");
    let directories = split(((execCmdEx "ls -d */")[0]).replace("/", ""), "\n");
 
    for file in allFiles:
        if directories.find(file) != -1:
            #echo "directory found - " & file;
            continue;
  
        #echo "file found - " & file;
    
        let fileExtension = split(file, ".")[split(file, ".").len()-1];

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
    if not cleanFlag:
        echo "Files sorted successfully";