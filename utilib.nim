import strutils;

proc unixifyText*(str: string) : string =
    var charsToSwap : array[4, string] = ["\\", "/", "\"", "\'"];
    var opt = str;
    for character in charsToSwap:
        opt = opt.replace(character, "\92" & character);
    return opt;