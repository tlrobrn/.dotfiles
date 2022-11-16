#!/usr/bin/ruby

require_relative "../os_command"

class InstallNvimPaq < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    stream_command('git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim')
  end

  def skip?
    File.exists?(File.expand_path("~/.local/share/nvim/site/pack/paqs/"))
  end
end

InstallNvimPaq.run!
