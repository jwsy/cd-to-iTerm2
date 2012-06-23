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
