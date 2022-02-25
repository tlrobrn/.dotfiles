#!/usr/bin/ruby

require_relative "../os_command"

class SetShell < OSCommand
  def mac
    `chsh -s $(which zsh)`
  end

  def debian
    `sudo chsh $(whoami) -s $(which zsh)`
  end
end

SetShell.run!
