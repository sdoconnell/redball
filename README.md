# redball
A command-line utility to download Powerball lottery results and compare them with a user ticket to determine winning numbers and calculate ticket value.

## Downloading
To download `redball` simply clone this repository:

    git clone https://github.com/sdoconnell/redball.git

### Python dependencies
`redball` requires Python 3.8+ and access to the Internet to retrieve lottery results. In addition, `redball` requires the following Python 3 libraries to be available:
- `requests`

You may install these dependencies from your Linux distribution's repos (if available) or via `pip` using the `requirements.txt` file provided in this repository:

    pip install -r requirements.txt

## Installing
You may then install `redball` one of two ways: via `setuptools` or via `make`. Installing via `make` will also install the manpage for `redball(1)` and will copy the `README.md` file into your system documentation directory.

### Setuptools
Run the `setup.py` script to install system-wide (likely requires `su` or `sudo`):

    sudo python3 setup.py install

Alternatively, you may install the package to your `$HOME` directory:

    python3 setup.py install --user

### Make
Use `make` to install the application system-wide (likely requires `su` or `sudo`):

    sudo make install

There is also an `uninstall` operation available:

    sudo make uninstall

## Using `redball`

### Basic usage
`redball` is a command-line application that can read lottery ticket information from a file, or from command options provided by the user.

    $ redball
    usage: redball.py [-h] [-f filename] [-c] [-l] [-w] [-m] [--to address[,address...]] [--from address]
                      [--server IP or host] [-q] [-n num,num,...] [-p number] [-x] [-d number] [-t YYYY-MM-DD]

    optional arguments:
      -h, --help            show this help message and exit
      -f filename, --file filename
                            ticket file name
      -c, --no-color        disable color output
      -l, --last-only       last draw only
      -w, --winners-only    show winners only
      -m, --send-mail       send results via email
      --to address[,address...]
                            mail recipient address(es)
      --from address        mail sender address
      --server IP or host   mail server
      -q, --quick-pick      generate quick pick
      -n num,num,..., --numbers num,num,...
                            white ball numbers (5)
      -p number, --powerball number
                            power ball
      -x, --powerplay      power play option
      -d number, --draws number
                            number of draws
      -t YYYY-MM-DD, --purchased YYYY-MM-DD
                            ticket purchase date
      -v, --version         show version info


### Ticket Information ###
The user can provide the ticket information interactively or in the form of a config-style text file.

A example ticket file is provided in the repo:

    [ticket]
    # white balls
    numbers = 6,13,19,34,41
    # red ball
    powerball = 23
    # did you buy PowerPlay? true or false
    powerplay = true
    # how many draws is the ticket good for?
    draws = 10
    # what is the purchase date of the ticket (YYYY-MM-DD)?
    purchased = 2021-10-01

**NOTE:** the ticket file format changed from version 1.0 to 2.x. If you upgrade to the latest version, please update your ticket file(s) accordingly.

To run a query using a pre-defined ticket file, input the name of the file with `-f`:

    $ ./redball -f ticket.example
    
    Ticket info
    ===========
    Purchased: 2021-10-01
    Draws: 10
    Remaining: 2
    Numbers: 06, 13, 19, 34, 41 [23]
    PowerPlay: Yes

    Results:
    2021-10-18 (30,32,48,53,63 [12]) - The ticket was not a winner.
    2021-10-16 (30,31,41,42,48 [03]) - The ticket was not a winner.
    2021-10-13 (23,29,47,59,60 [15]) - The ticket was not a winner.
    2021-10-11 (11,20,33,39,65 [24]) - The ticket was not a winner.
    2021-10-09 (12,17,30,45,62 [05]) - The ticket was not a winner.
    2021-10-06 (01,17,52,58,64 [01]) - The ticket was not a winner.
    2021-10-04 (12,22,54,66,69 [15]) - The ticket was not a winner.
    2021-10-02 (28,38,42,47,52 [01]) - The ticket was not a winner.

    Total ticket value: $0

For a single-draw ticket, the information might be provided interactively: 

    $ ./redball -n 8,21,32,38,46 -p 15 -x -t 2021-10-01

    Ticket info
    ===========
    Purchased: 2021-10-01
    Draws: 1
    Remaining: 0
    Numbers: 08, 21, 32, 38, 46 [15]
    PowerPlay: Yes

    Results:
    2021-10-18 (30,32,48,53,63 [12]) - The ticket was not a winner.

    Total ticket value: $0

### Color output
`redball` provides color output by default in terminals that support color, but this option may be turned off with the `-c` switch.

### Filtering results
The output of the program can be filtered with the `-l` option (to show only the last drawing) or the `-w` option (to show only winning drawings).

### Email output
`redball` can send the ticket results via email using the `-m` (mail) option in combination with `--to` (one or more recipients, comma-delimited), `--from` (sender address), and `--server` (the SMTP mail server). If `--server` is not provided, the server defaults to `localhost`.

**NOTE**: `-m` also implies `-c` to prevent terminal color codes from being sent in email contents.

### Automation
`redball` queries can be scheduled via `cron` to check ticket results automatically and email the results.

Sample crontab:
    
    # check lottery ticket every Sunday, Tuesday, and Thursday at 06:00, email results to user@example.com
    0 6 * * 0,2,4 /usr/local/bin/redball -f /home/user/ticket.txt -m --to user@example.com --from results@example.com > /dev/null 2>&1


