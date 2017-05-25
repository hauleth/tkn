require 'colorize'

def rainbow!(string)
  string
    .each_line
    .zip(%i(red yellow green magenta blue cyan))
    .map { |line, color| line.colorize(color) }
    .join
end

section "Nix\nNormal SysOps for a normal person" do
  center 'http://bit.ly/uzi-in-bruges'

  center 'What is wrong with our World?'

  block <<-EOS
  - state-full machines
  - incompatible releases
  - global-wide installations
  EOS

  center 'Here come Nix'

  block <<-EOS
  Nix is purely functional Package Manager

  This mean:

  - no mutable state
  - everything is a function
  - you always can reproduce system state
  EOS

  center "Example\nDo (not) try this at home"

  center "Thanks\n@hauleth"
end
