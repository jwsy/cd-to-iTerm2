cd-to-iTerm2
============

Applescript to open an iTerm2 terminal from the current directory in Finder

iTerm2 (http://www.iterm2.com/) is the best terminal app that OSX has and is loaded with great features including awesome search, built-in autocomplete, mouseless copy, and the very visually cool Instant Replay.

When I want to open the Finder folder I'm viewing in iTerm, use Quicksilver to launch this app by Stefan van den Oord: http://code.google.com/p/iterm2/wiki/AppleScript#Example_of_"cd_to"_command. This works perfectly except when I have a folder with an exclamation mark in it, so I made a small change to the below code so that it sends a ' instead of a \".

```
-- Stefan van den Oord, 2010-12-29
-- The "cd to" command for iTerm2

tell application "Finder"
        set _cwd to POSIX path of ((folder of (front window)) as alias)
end tell
tell application "iTerm2"
        activate    
        try
                set _session to current session of current terminal
        on error
                set _term to (make new terminal)
                tell _term
                        launch session "Default"
                        set _session to current session
                end tell
        end try
        
        tell _session
                -- write text "pushd \"" & _cwd & "\""
                write text "pushd '" & _cwd & "'"
        end tell
end tell
```