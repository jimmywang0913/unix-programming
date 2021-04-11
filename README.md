# lsof remake
    use only three parameter -f -c -t
## -f
    a regular expression (REGEX) filter for filtering filenames.
## -c
    a regular expression (REGEX) filter for filtering command line. For example -c sh would match bash, zsh, and share.
## -t
     a TYPE filter. Valid TYPE includes REG, CHR, DIR, FIFO, SOCK, and unknown. TYPEs other than the listed should be considered as invalid. For invalid types, your program have to print out an error message Invalid TYPE option. in a single line and terminate your program.
