# UFB (User Friendly Bash) : Bash simple cli framework (Still under construction!)
The idea is to make bash more userfriendly an sharing lib's between multiple  scripts instead of copy/paste or manual sourcing.

# How to 
1. Download the repository and put bin/ufb.sh inside anywhere in $PATH
2. cp libs/* inside /usr/share/ufb
3. Create a new shelscript and as shebang use the ufb.sh
4. That's pretty all, now you can simply import libs's etc.. 
  
# IDEA
MAke more libs and a whole documentation of core libs. 

# Doc
The function doc
## Builtin
### .isDigit
USAGE: .isDigit NUMBER
Check if the given string is a digit
### .matchString
USAGE: .matchString STRING1 STRING2
Check if string1 match string2
### .matchRegex
USAGE: .matchRegex STRING REGEX
Check if string match regex
### .isEmpty
USAGE: .isEmpty STRING
Check if string is empty
### .inArray
USAGE: .inArray referenceArray STRING
Check if string is in array
### .trim
USAGE: .trim referenceVariable
Trim the referenceVariable
### die
USAGE: die message
Exit 2 and print message to STDERR
### load
USAGE: load LOADABLE
Enable the following builtin from $BASH_LOADABLE_PATH and add it to RUNTIME_LOAD
### import
USAGE: import IMPORT
Example: import core/mktemp
Source the following lib from $IMPORT_PATH (: seperated list like $PATH). The lib need to have the following suffix: .shm

The Core doc will be written inside: doc/{core,extra,parser}
