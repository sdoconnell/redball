---
title: REDBALL
section: 1
header: User Manual
footer: redball 3.0
date: April 2, 2023
---
# NAME
redball - a command-line Powerball lottery tool.

# SYNOPSIS
**redball** [*OPTION*]...

# DESCRIPTION
**redball** is a command-line utility for downloading Powerball lottery results and comparing them with a user ticket to determine winning numbers and calculate ticket value.

# OPTIONS
**-h**, **--help**
: display help information

**-f**, **--filename** *filename*
: filename of ticket to parse

**-c**, **--no-color**
: disable color output

**-l**, **--last-only**
: only show results for the last drawing

**-w**, **--winners-only**
: only show results for winning tickets

**-m**, **--send-mail**
: send the results via email (requires **--to**, **--from**, and optionally **--server**).

**--to**
: mail recipient address(es). multiple addresses must be comma-delimited.

**--from**
: mail sender address.

**--server**
: (optional) the SMTP IP address or hostname to use. defaults to 'localhost'.

**-q**, **--quick-pick**
: generate a Powerball quick pick (random ticket).

**-n**, **--numbers** *number*,*number*,...
: the five white ball numbers (comma-delimited).

**-p**, **--powerball** *number*
: the powerball number

**-x**, **--powerplay**
: (optional) the PowerPlay option was purchased for this ticket. 

**-d**, **--draws** *number*
: (optional) the number of draws purchased for this ticket. defaults to 1.

**-t**, **--purchased** *YYYY-MM-DD*
: the ticket purchase date.

**-v**
: show version info

# AUTHORS
Written by Sean O'Connell <https://sdoconnell.net>.

# BUGS
Submit bug reports at: <https://github.com/sdoconnell/redball/issues>

# SEE ALSO
Further documentation and sources at: <https://github.com/sdoconnell/redball>
