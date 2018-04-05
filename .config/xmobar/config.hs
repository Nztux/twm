Config {
    font = "xft:Source Code Pro Medium:size=10",
    additionalFonts = [ "xft:FontAwesome:pixelsize=14" ],
    --font = "xft:Source Code Pro Medium:size=9",
    --bgColor = "#00181f",
    bgColor = "#000000",
    fgColor = "#657b83",
    border = NoBorder,
    borderColor = "black",
    hideOnStart = False,
    persistent = True,
    position = Bottom,
    lowerOnStart = True,
    commands = [
        Run Cpu ["-t","<fn=1>\xf085</fn> <vbar>",
                 "-L", "3", "-H", "50",
                 "--low", "#2aa198", "--normal", "#93a1a1", "--high", "#dc322f"] 20,
        Run CoreTemp ["-t", "<fc=#93a1a1><fn=1>\xf2cb</fn> <core0>°C</fc>",
                      "-L", "30", "-H", "70",
                      "--low", "#2aa198", "--normal", "#93a1a1", "--high", "#dc322f"] 50,
        Run Battery [ "-t", "<fc=#b58900><acstatus></fc>"
            , "-L", "20"
            , "-H", "85"
            , "-l", "#dc322f"
            , "-n", "#b58900"
            , "-h", "#b58900"
            , "--" -- battery specific options
            -- discharging status
            , "-o"  , "<fn=1>\xf242</fn> <left>% (<timeleft>) <watts>"
            -- AC "on" status
            , "-O"  , "<fn=1>\xf1e6</fn> <left>%"
            -- charged status
            , "-i"  , "<fn=1>\xf1e6</fn> <left>%"
            , "--off-icon-pattern", "<fn=1>\xf1e6</fn>"
            , "--on-icon-pattern", "<fn=1>\xf1e6</fn>"
            ] 20,
        Run Com "keyboard_status.sh" [] "kb" 20,
        --Run BatteryP ["BAT0"]
        --    ["-t", "Bat: <left>% / <timeleft>",
        --    "-L", "10", "-H", "80", "-p", "3",
        --    "--", "-O", "<fc=#2aa198>Charging</fc>", "-i", "",
        --    "-L", "-15", "-H", "-5",
        --    "-l", "#dc322f", "-m", "#93a1a1", "-h", "#2aa198"]
        --    100,
        Run Memory ["-t", "<usedvbar>",
                    "-L", "10", "-H", "70",
                    "--low", "#2aa198", "--normal", "#93a1a1", "--high", "#dc322f"] 50,
        --Run Date "<fc=#93a1a1>%a %b %_d %Y %H:%M</fc>" "date" 10,
        Run Com "status_net.sh" [] "net" 20,
        Run Date "<fc=#268bd2><fn=1>\xf073</fn> %a %_d %b %Y | d.%j w.%W</fc>   <fc=#2AA198><fn=1></fn> %H:%M:%S</fc>" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = " %StdinReader% }{ %cpu%%memory%   %battery%   %coretemp%   %net%   %date%   %kb%"
}
