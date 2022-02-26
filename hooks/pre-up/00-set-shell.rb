#!/usr/bin/ruby

require_relative "../os_command"

class SetShell < OSCommand
  def mac
    stream_command("brew install zsh") if install_zsh?

    stream_command("chsh -s $(which zsh)")
  end

  def debian
    stream_command("sudo apt-get -y install zsh") if install_zsh?

    stream_command("sudo chsh $(whoami) -s $(which zsh)")
  end

  def skip?
    `echo $0`.include?("zsh")
  end

  def install_zsh?
    `which zsh`.empty?
  end
end

SetShell.run!
