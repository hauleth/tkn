require 'colorize'

def rainbow!(string)
  string
    .each_line
    .zip(%i(red yellow green magenta blue cyan))
    .map { |line, color| line.colorize(color) }
    .join
end

section "CLI Ninja\nTMux, SSH, Vim & friends" do
  block <<-EOS
    Why GUI?

    - easy (low learning curve)
    - no manuals needed (at least in theory)
    - available through RDP, VNC, even SSH (X11)
    - user-friendly
  EOS

  block <<-EOS
    Why CLI?

    - configurable
    - keyboard-only usage (with mouse possibilities)
    - you can do anything (you use *NIX, don't you?)
    - available through pure SSH
  EOS

  center rainbow! <<-'EOS'
______ _____  _    _ ___________ _ _ _
| ___ \  _  || |  | |  ___| ___ \ | | |
| |_/ / | | || |  | | |__ | |_/ / | | |
|  __/| | | || |/\| |  __||    /| | | |
| |   \ \_/ /\  /\  / |___| |\ \|_|_|_|
\_|    \___/  \/  \/\____/\_| \_(_|_|_)
  EOS

  section 'Bash' do

  end

  section "TMux\n#{'T'.bold + 'erminal ' + 'Mul'.bold + 'tiplexer'}" do

    block <<-EOS
      - Run multiple 'windows'
      - Detach sessions (run them in background)
      - Splitting terminal window
      - Running the same session in different
        terminals (helpful in pair programming)
    EOS

    center 'You can see it running ' + 'now'.bold

    code <<-EOS
      $ tmux new -s test

      ^B^D

      $ tmux attach -s test
    EOS

    block <<-EOS
      Why use multiplexers?

      - you will not always have possibility
        to run 2 instances of terminal
        at the same time (i.e. working on remote)
      - detaching processes is often use-case
        moving them to background (^Z will work,
        but until you close session)
      - simple screen sharing (pair programming
        done right)
    EOS
  end

  section 'telnet & SSH' do
    block <<-EOS
      telnet is tool to connect to remote server
      and write raw commands to it. I.e. you can
      connect to any HTTP server and send HTTP
      request!
    EOS

    code <<-EOS
      $ telnet www.example.org 80
      GET /index.html HTTP/1.1
      Host: www.example.com


      HTTP/1.1 200 OK
      Accept-Ranges: bytes
      Cache-Control: max-age=604800
      Content-Type: text/html
      …
    EOS

    center 'Also'

    center <<-EOS
      there are movies
      telnet towel.blinkenlights.nl
    EOS

    center <<-EOS
      and games
      telnet luc.pl 4000
    EOS

    block <<-EOS
      SSH is acronym of Secure SHell which is dedicated tool
      for remote shell (earlier there was rsh, but no one
      remember that).

      It provide encryption of tunnel and secure authentication
      (like public-key).

      Many of tools rely on SSH protocol, i.e.:
      - SVN
      - Git
      - rsync
    EOS

    block <<-EOS
      Why the 'secure' part is so important?

      Because when you work on remote host
      you often send crucial data that should
      be private, i.e. DB credentials or
      OAuth API keys. Using telnet or rsh
      anyone can read that data (like in HTTP).
    EOS
  end

  section "Vim\nVi Improved" do
    block <<-EOS
      - Written in C, so can be run on almost any OS (Windows too)
      - Lightweight
      - Highly customizable through built-in scripting language VimL
      - Powerful!
    EOS

    center 'Cons?'

    center 'Hard to begin'

    center 'No'

    center 'Really'

    center 'Hard as f' + 'uck'.hide

    center 'If so. Is it worth learning?'

    center 'Hell YEAH'.red

    block <<-EOS
      Vim modes (at least the most used one):

      Normal   - this is state where you can go to any other mode and use most
                 Vim power (by default Vim start in this mode)
      Ex       - in this mode you can call all Ex commands and Vim methods
                 (i.e. `:help` or `:%g/re/p`)
      Insert   - in this mode you can insert new text to file
      Visual   - select text
      L-Visual - select whole lines
      B-Visual - select block of text
      Replace  - suprise - it allow to replace text under cursor (like in Word)
    EOS

    block <<-EOS
      Moving around:
                              gg

                      #  N  ?text

                              ^b

                               H

                               {  (

        ,         B   gE       k               ;
0   ^   Fx   Tx   b   ge   h       l   e   w   tx   fx   $
                               j   E   W

                            )  }

                               L

                              ^f

                             /text  n  *

                               G
    EOS

    block <<-EOS
      Another (built-in) features:

      - advanced completion (OmniCompletion)
      - syntax coloring (WoW)
      - multiline editing
      - history tree (`:earlier 5m`)
      - regexp search
      - `ctags` integration
    EOS

    block <<-EOS
      And some awesome plugins:

      - Fugitive - best Git tool ever!!!
      - netrw - edit files on remote with local .vimrc (also is faster)
      - Gundo - Time Machine for your Vim (don't get lost in time)
      - Airline - Powerline sucks, so rewrite it in VimL (YAY!!!)
      - Emmet - easier HTML editing
      - NERDCommenter - the 'ol good (commenting) in-out
      - CtrlP - FuzzyFinding files
      - IndentGuides - show how many indentation levels you have
      - Syntastic - check code style (JSHint and Rubocop available)
      - Snipmate - TextMate-like snippets
      - SuperTab - one <tab> to rule them all
      - Surround - surround your code in nanoseconds
      - TagBar - `ctags` in sidebar
    EOS
  end
end

center <<-EOS
  Thanks
#{'Łukasz Jan Niemier'.blue.bold}
  @hauleth
EOS
