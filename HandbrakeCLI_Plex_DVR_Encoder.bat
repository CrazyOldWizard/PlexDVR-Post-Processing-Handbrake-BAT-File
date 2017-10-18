@echo off
set path=%1
set path2="%~dp1%~n1"
:: Change the path below for the location of the log file. 
set logfile="%UserProfile%\EncodeLog.txt"
:: Logging
if not exist %logfile% (
   echo %time%:: -- Begin Log File -- > %logfile%
)
echo %time%:: Current path set to: %path% >> %logfile%
echo %time%:: Current file name set to: %path2% >> %logfile%
:: Starting HandBrakeCLI
echo %time%:: Starting HandbrakeCLI.exe >> %logfile%
:: Path to HandbrakeCLI.exe - If using a preset, you will need to change the directory of the .json file as well as the name of the preset.
C:\directory\to\HandBrakeCLI.exe --maxHeight 720 --maxWidth 1280 --preset-import-file "C:\directory\to\HandbrakePreset.json" -Z "NameOfPresetInHandbrakeUI" copy -i %path% -o %path2%.mkv
:: If new file exists, then delete the original file
if exist "%path2%.mkv" (
   del ""%path%""
   echo %time%:: Deleted file: ""%path%"" >> %logfile%
)