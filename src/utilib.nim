import strutils;
import osproc;

proc unixifyText*(str: string) : string =
    let charsToSwap : array[4, string] = ["\\", "/", "\"", "\'"];
    var opt = str;
    for character in charsToSwap:
        opt = opt.replace(character, "\92" & character);
    return opt;

proc directoryExists*(dirPath: string) : bool =
    if (execCmdEx "if test -d "&dirPath.replace("~", "$HOME")&"; then echo 1; fi")[0].find("1") != -1:
        return true;
    else:
        return false;