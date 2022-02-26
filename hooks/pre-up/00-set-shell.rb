#!/usr/bin/ruby

require_relative "../os_command"

class SetShell < OSCommand
  def mac
    `brew install zsh` if install_zsh?

    `chsh -s $(which zsh)`
  end

  def debian
    `sudo apt-get -y install zsh` if install_zsh?

    `sudo chsh $(whoami) -s $(which zsh)`
  end

  def skip?
    `echo $0`.include?("zsh")
  end

  def install_zsh?
    `which zsh`.empty?
  end
end

SetShell.run!
