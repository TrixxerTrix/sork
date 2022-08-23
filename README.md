# sork
script-hub, basically lunarian sh v2
i allow modification of the script but making more "overpowered" versions i shall not allow

uses a new json system for redirections of scripts
(lua table string > lua table)

# how it works
once you launch the game it gets the place-id and it checks for it in the gamesDictionary lua file, then gets the string of the dictionary, puts it in a loadstring 
function with a return at the start, then just makes it a table then it does stuff!!!

the order is:
~~numbers > buttons > toggles > strings (i can change it if i want but i think it's alright for now)~~
**ACTUALLY.. there is no order!** since the next loop just loops through the order it'll just go in order however the callbacks are organized
