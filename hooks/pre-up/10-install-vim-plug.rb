#!/usr/bin/ruby

require_relative "../os_command"

class InstallVimPlug < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
  end

  def skip?
    File.exists?(File.expand_path("~/.local/share/nvim/site/autoload/plug.vim"))
  end
end

InstallVimPlug.run!
