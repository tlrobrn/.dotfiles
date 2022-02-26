#!/usr/bin/ruby

require_relative "../os_command"

class InstallP10k < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    stream_command(
      "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git"\
      "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    )
  end

  def skip?
    File.exists?(File.expand_path("${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"))
  end
end

InstallP10k.run!
