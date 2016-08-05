@echo off

REM Place this batch file in the same directory as the INPs
REM Requires Rich Pasco's HexDump executable to be present alongside batch file in inp directory
REM http://www.richpasco.org/utilities/hexdump.html
REM Grab the base and end timestamps of an INP, and the game short name
REM Put each result into a separate text file
REM Timestamps are 8 bytes (only first 4 are used), little endian, hex value Unix time
REM Base time begins at 0x08, end time begins at 0x38
REM Game short name is 12 bytes and begins at 0x14
REM The results from the hexdump will be on identical lines in each text file
REM So, the base time, end time, and game name of the first INP will be on the first line of each text file
REM The second inp results will be on the second line, etc.

for %%a in (*.inp) do hexdump /skip:$8 /keep:4 /bare %%a >>start.txt
for %%a in (*.inp) do hexdump /skip:$38 /keep:4 /bare %%a >>end.txt
for %%a in (*.inp) do hexdump /skip:$14 /keep:12 /bare %%a >>inp.txt