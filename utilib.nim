import strutils;
import osproc;

proc unixifyText*(str: string) : string =
    let charsToSwap : array[4, string] = ["\\", "/", "\"", "\'"];
    var opt = str;
    for character in charsToSwap:
        opt = opt.replace(character, "\92" & character);
    return opt;

proc directoryExists*(dirPath: string) : bool =
    let dirToCheck = "if test -d "&dirPath.replace("~", "$HOME")&"; then echo 1; fi";
    var cmdOpt = (execCmdEx dirToCheck)[0];
    if cmdOpt.find("1") != -1:
        return true;
    else:
        return false;