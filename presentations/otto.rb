require 'colorize'

def rainbow!(string)
  string
    .each_line
    .zip(%i(red yellow green magenta blue cyan))
    .map { |line, color| line.colorize(color) }
    .join
end

section "Otto\nbeyond Vagrant" do
  block <<-"EOS"
    Vagrant:

    - created in 2010 by Mitchell Hashimoto
    - simplified development by replicating infra on dev machines
    - written in Ruby
    - custom DSL to manage boxes
  EOS

  block <<-"EOS"
    What is wrong with that?

    - written in Ruby (additional dependency)
    - "independent" from real infra
    - DSL is complex, configuration is not
  EOS

  center rainbow! <<-'EOS'
____                        _ _ _
| __ )  ___   ___  _ __ ___ | | | |
|  _ \ / _ \ / _ \| '_ ` _ \| | | |
| |_) | (_) | (_) | | | | | |_|_|_|
|____/ \___/ \___/|_| |_| |_(_|_|_)
  EOS

  section 'Otto' do
    block <<-EOS
    - written in Go (no deps)
    - automatically detect project type (skip most of provisioning)
    - use HCL to describe state of infra (no logic)
    - use Consul to provide service discovery
    - use Packer to deploy infra (real replication)
    EOS

    center 'But for now it is just warper around Vagrant'

    section 'Example' do
      code <<-EOS
# Appfile

application {
  name = "orodruin"
  type = "ruby"

  dependency {
    source = "github.com/happyspike/otto-postgresql"
  }
}
      EOS

      center '$ otto dev'
      center '$ otto dev ssh'
      center '$ otto dev destroy'

      center "There should be live demo, but it doesn't work :("
    end
  end
end

center <<-EOS
  Thanks
#{'Łukasz Jan Niemier'.bold}
  @hauleth
EOS
