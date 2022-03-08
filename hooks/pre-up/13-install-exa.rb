#!/usr/bin/ruby

require_relative "../os_command"

class InstallExa < OSCommand
  def mac
    stream_command("brew install exa")
  end

  def debian
    stream_command("wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip -O /tmp/exa.zip")
    stream_command("unzip /tmp/exa.zip -d /tmp/exa")
    stream_command("cp /tmp/exa/bin/exa /usr/local/bin")
    stream_command("cp /tmp/exa/man/* #{manpath}")
    stream_command("cp /tmp/exa/completions/exa.zsh /usr/local/share/zsh/site-functions")
    stream_command("rm -rf /tmp/exa")
  end

  def skip?
    !`which exa`.empty?
  end

  def manpath
    @manpath ||= `manpath`.split(":")[0]
  end
end

InstallExa.run!
